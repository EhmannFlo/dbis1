ALTER SESSION SET NLS_DATE_FORMAT = 'DD.MM.YYYY';

CREATE TABLE Bankverbindung
        (IBAN               CHAR(22) constraint iban_pk PRIMARY KEY  constraint check_iban CHECK(length(IBAN) = 22),
         Kontonummer        NUMBER(10) NOT NULL constraint check_kontonummer CHECK(length(Kontonummer)<= 10)CHECK(Kontonummer > 0),
         BLZ                NUMBER(8)  NOT NULL constraint check_blz CHECK(length(BLZ) = 8)CHECK(BLZ > 0),
         BIC                NUMBER(11) constraint check_bic CHECK (length(BIC) <= 11)CHECK(BIC > 0), 
                                       constraint bankverbindung_unique UNIQUE(Kontonummer, BLZ)
                            );
COMMENT ON TABLE Bankverbindung IS 'IBAN: [0,1] = Buchstaben, Rest Zahlen';


 CREATE TABLE Zusatzausstattung
        (
         AusstattungID       varchar(256) constraint ausstattung_pk primary key 
        );
        
        
CREATE TABLE Fluggesellschaft
        (FluggesellschaftsID varchar(256) constraint fluggesellschaft_pk PRIMARY KEY ,
         Rating             NUMBER(2) constraint check_rating CHECK(Rating BETWEEN 1 and 10 )  DEFERRABLE -- erst nach commit soll upadte kommen
        );
COMMENT ON TABLE Fluggesellschaft IS '1 beste Rating, 10 schlechteste Rating';


CREATE TABLE Land 
        (ISO_Code           CHAR(3) constraint iso_pk PRIMARY KEY,
         LandName           VARCHAR(256) NOT NULL constraint land_unique UNIQUE
         );


CREATE TABLE Ort 
         (OrtsID            INTEGER constraint ort_pk PRIMARY KEY,
          OrtName           VARCHAR(256),
          FlughafenID       INTEGER constraint flughafenid_nl NOT NULL,
          ISO_Code          CHAR(3)constraint iso_code_nl NOT NULL ,
                            constraint ort_land_fk foreign key(iso_code) references Land(ISO_Code)              
           );   
           
         
CREATE TABLE Adresse
        (AdressID           INTEGER constraint adress_pk PRIMARY KEY,
         Strasse            VARCHAR(256) constraint strasse_nl NOT NULL,
         PLZ                INTEGER NOT NULL constraint check_plz check(PLZ > 0),
         Hausnummer         VARCHAR(6) constraint check_hausnummer check(Hausnummer > 0),
         OrtsID             INTEGER constraint ortsid_nl NOT NULL
        );
COMMENT ON TABLE Adresse IS 'PLZ muss zum Ort passen';    


CREATE TABLE Flughafen
        (FlughafenID        INTEGER constraint flughafen_pk PRIMARY KEY,
         FlughafenName      varchar(256) constraint flughafen_unique unique,
         AdressID           INTEGER constraint flughafen_adress_unique UNIQUE NOT NULL, 
                            constraint flughafen_adress_fk foreign key(AdressID)references Adresse(AdressID)                           
        );
        
        
ALTER TABLE Ort
ADD CONSTRAINT FK_Ort_Flughafen Foreign Key(FlughafenID) REFERENCES Flughafen(FlughafenID)                   
Deferrable Initially Deferred;
-- wir pruefen vor commit schon ob es den alter table gibt und nach dem commit 


CREATE TABLE Ferienwohnung
        (FerienwohnungID    INTEGER constraint ferienwohnung_pk PRIMARY KEY,
         Preis              DECIMAL(10,2) NOT NULL constraint check_preis
                            CHECK(Preis > 0),
         AnzahlZimmer       DECIMAL(3,1) NOT NUll constraint check_zimmer
                            CHECK(AnzahlZimmer > 0),
         Groesse            DECIMAL(5,1) NOT NULL constraint check_groesse
                            CHECK(Groesse > 0),
         Beschreibung       VARCHAR(256) NOT NULL,        
         AdressID           INTEGER NOT NULL ,
                            constraint ferienwohnung_adress_fk foreign key(AdressID)references Adresse(AdressID)
        );
COMMENT ON TABLE Ferienwohnung IS 'Preis in Euro/Tag, Groesse in qm'; 



CREATE TABLE Bild
        (BildID             INTEGER constraint bild_pk PRIMARY KEY,
         Beschreibung       VARCHAR(256),
         Dateipfad          VARCHAR(256) NOT NULL constraint dateipfad_unique UNIQUE,
         FerienwohnungID    INTEGER constraint ferienwohnungid_nl NOT NULL ,
                            constraint bild_fid_fk foreign key(FerienwohnungID) references Ferienwohnung(FerienwohnungID) 
         );

CREATE TABLE Touristenattraktion
        (TouristenattraktionID  INTEGER constraint touristenattraktion_pk PRIMARY KEY,
         Beschreibung           VARCHAR(256) constraint beschreibung_notnull NOT NULL,
         AdressID               INTEGER constraint adressid_nl NOT NULL,
                                constraint tourist_adress_fk foreign key(AdressID)references Adresse(AdressID)
         );                          
 
CREATE TABLE Kunde
        (KundenNr           VARCHAR(256) constraint kunde_pk PRIMARY KEY,
         Geburtsdatum       DATE constraint dote_nl NOT NULL,
         Nachname           VARCHAR(256) constraint nachname_nl NOT NULL,
         Vorname            VARCHAR(256) constraint vorname_nl NOT NULL,
         Telefonnummer      VARCHAR(100) NOT NULL constraint check_phonenumber Check(length(Telefonnummer)<= 15),
         AdressID           INTEGER constraint adressid_kunde_nl NOT NULL,
                            constraint kunde_adress_fk foreign key(AdressID)references Adresse(AdressID),
         IBAN               CHAR(22)  NOT NULL constraint kunde_iban_unique unique,
                            constraint kunde_iban_fk foreign key(iban) references Bankverbindung(IBAN) ,
                            constraint check_iban2 CHECK(length(IBAN) = 22),
         email              VARCHAR(256) NOT NULL constraint kunde_email_unique UNIQUE 
                            ); 

CREATE TABLE Belegung
        (BelegNr            VARCHAR(256) constraint beleg_pk PRIMARY KEY,
         Buchungsdatum      DATE constraint buchungsdatum_nl NOT NULL,
         Status             CHAR(13) NOT NULL constraint check_status
                            CHECK(Status = 'verbindlich' or Status = 'unverbindlich') ,
         von                DATE constraint von_nl NOT NULL,
         bis                DATE constraint bis_nl NOT NULL,
         FerienwohnungID    INTEGER constraint ferienwohnung_belegung_nl NOT NULL,
                            constraint belegung_fid_fk foreign key(ferienwohnungid) references Ferienwohnung(FerienwohnungID),
         KundenNr           VARCHAR(256) NOT NULL,
                            constraint belegung_kundennr_fk foreign key(kundennr)references Kunde(KundenNR),
         constraint check_date
         Check (von < bis) 
         );

COMMENT ON TABLE Belegung IS 'Status nur verbindlich (gebucht) oder unverbindlich (nur reserviert), keine Doppelbuchungen';
    
CREATE TABLE Rechnung
         (RechnungsNr       VARCHAR(256) constraint rechnung_pk PRIMARY KEY,
          Datum             DATE constraint rechnung_datum_nl NOT NULL,
          Betrag            DECIMAL(10,2)  constraint betrag_nl NOT NULL,
          Zahlungseingang   DATE,
          BelegNr           VARCHAR(256) constraint belegnr_nl NOT NULL
                            constraint beleg_unique UNIQUE, 
                            constraint rechnung_belegnr_fk foreign key(belegnr)references Belegung(BelegNr)
          );
          
COMMENT ON TABLE Rechnung IS 'Betrag in Euro';

--ab hier referentielle integritaet (on delete cascade)
CREATE TABLE fliegt
         (
          FluggesellschaftsID varchar(256) ,      
          Start_Flughafen varchar(256),          
          Ziel varchar(256),                  
          constraint fliegt_pk PRIMARY KEY(FluggesellschaftsID , Start_Flughafen , Ziel),
          constraint fluggesellschaft_fk foreign key(FluggesellschaftsID)REFERENCES Fluggesellschaft(FluggesellschaftsID) on delete cascade,
          constraint start_flughafen_fk foreign key(Start_Flughafen) references Flughafen(flughafenname) on delete cascade,
          constraint ziel_fk foreign key(ziel) references Flughafen(flughafenname),
          constraint check_flughafen CHECK (Start_Flughafen != Ziel) 
          ); 
          
CREATE TABLE ergibtEntfernung
        (Ort1 INTEGER,
         constraint ort1_entfernung_fk foreign key(ort1) REFERENCES Ort(OrtsID) on delete cascade, --vater son tabelle
         Ort2 INTEGER,
         constraint ort2_entfernung_fk foreign key(ort2) REFERENCES Ort(OrtsID) on delete cascade,
         km   decimal(7, 2)
         constraint check_km
         Check(km >= 0) ,
         constraint ergibt_km_pk PRIMARY KEY (Ort1, Ort2),
         constraint check_ort CHECK(Ort1 <> Ort2) 
         );
COMMENT ON TABLE ergibtEntfernung IS 'Entfernung zwischen 2 Orten nur 1-mal speichern, Wenn km = 0 nicht eintragen';

CREATE TABLE hat
        (AusstattungID varchar(256),
         constraint ausstattung_fk foreign key(ausstattungid) REFERENCES Zusatzausstattung(AusstattungID) on delete cascade,
         FerienwohnungID INTEGER,
         constraint hat_ferienwohung_fk foreign key(ferienwohnungid) REFERENCES Ferienwohnung(FerienwohnungID) on delete cascade,
         constraint hat_pk PRIMARY KEY (AusstattungID, FerienwohnungID)
         );     

--Erweiterung Schema um stornierte Buchungen (nur verbindliche, nicht unverbindliche!)         
create table stornierteBuchungen (
        StornierungsNR Integer constraint stornierteBuchungen_pk primary key,
        Stornierungsdatum date constraint stornier_datum_nl not null,
        Buchungsnummer integer constraint stornie_unique not null unique,
        Buchungsdatum date constraint stornier_buchungsdatum_nl not null,
        Zeitraum varchar(32) constraint stornier_zeitraum_nl not null,
        Buchungswert dec(8,2) constraint stornier_buchungswert_nl not null,
        Status varchar(32) constraint stornier_status_nl not null,
        Kundennr varchar(256) constraint stornier_kundennr_nl not null,
        Kundenname varchar(256) constraint stornier_kundenname_nl not null,
        Ferienwohnungnr Integer constraint stornier_ferienwohnungnr_nl not null,
        BeschreibungFW varchar(256) constraint stornier_beschreibung_nl not null
        );

--Sequnz nutzen für automatische Wertzuweisung von StornierungsNr
create sequence Standard_Sequenze;


create or replace function preis(Tage Integer , FeWoNr integer)
return Decimal as 
Buchungswert Decimal;
begin
select (f.preis * Tage) into Buchungswert from ferienwohnung f
where f.ferienwohnungid = FeWoNr;
return (Buchungswert);
end;
/    
--select preis(5, 5) from dual;
create or replace function abbuchung( von date,  bis date) return integer as 
Tage integer;
begin
        Tage:= (TO_DATE(bis, 'DD-MM-YYYY') - TO_DATE(von, 'DD-MM-YYYY'));
        return Tage;
end;
/


create or replace function vollername(kunden_id integer) return varchar as vor_nachname varchar(256);
kvorname varchar(256); knachname varchar(256);
begin
select nachname into knachname from kunde where kundennr = kunden_id;
select vorname into kvorname from kunde where kundennr = kunden_id;
vor_nachname := kvorname || ' ' || knachname;
return vor_nachname;
end;
/

create or replace Trigger BuchungStornieren before delete on Belegung for each row
when (old.status = 'verbindlich')
declare fbesch varchar(256); counter integer; payment date; available varchar(256);
begin

select count(*) into counter 
    from Rechnung r
    where :old.belegnr = r.belegnr; 
    if counter>0 then 
        select Zahlungseingang into payment from Rechnung r where :old.belegnr = r.belegnr;
        if payment is null then available := 'offen';
        elsif payment is not null then available := 'bezahlt';
        end if;
    else 
    available := 'offen';
    end if;

select f.beschreibung into fbesch from ferienwohnung f where f.ferienwohnungid = :old.ferienwohnungid;
insert into stornierteBuchungen(StornierungsNR, Stornierungsdatum, Buchungsnummer, Buchungsdatum, Zeitraum, 
Buchungswert,Status ,Kundennr, Kundenname, Ferienwohnungnr, BeschreibungFW)
values(Standard_Sequenze.NEXTVAL ,
current_date , 
:old.Belegnr, 
:old.Buchungsdatum ,
abbuchung(:old.von , :old.bis),
preis(abbuchung(:old.von , :old.bis),
:old.ferienwohnungid),
available,
:old.Kundennr, 
vollername(:old.kundennr), 
:old.FerienwohnungID,
fbesch ); 
delete from rechnung r where r.belegnr = :old.belegnr;
end;
/
show errors;
commit; 

--4.1   Buchung
create view Buchung as
    Select BelegNr, Buchungsdatum, von, bis, FerienwohnungID, KundenNr   
    from Belegung
    where Status = 'verbindlich';
        
    --  Reservierung
create view Reservierung as
    Select BelegNr, Buchungsdatum, von, bis, FerienwohnungID, KundenNr 
    from Belegung
    where Status = 'unverbindlich';
    
----    

    

--4.2   Familienwohnungen
create view Familienwohnungen as
    select *
    from Ferienwohnung
    where groesse > 100
    with Check option; --uberpruft auf kunftige Daten, ob sie die Bedingung (> 100) erfuellen

--test zum einfuegen
--insert into Familienwohnungen(FerienwohnungID , Preis , AnzahlZimmer, Groesse , Beschreibung , AdressID )
--values(12, 150.00 , 04.0 , 101 , 'Strandbungalow', 17 );

--4.3 UebersichtKunden
create view UebersichtKunden as
    select  k.kundennr, k.Nachname, k.Vorname, ba.iban, k.email,a.adressid, a.plz,a.Strasse, a.Hausnummer, b.belegnr,  f.ferienwohnungid,
              f.beschreibung, b.von, b.bis, b.status , b.Buchungsdatum 
    from Adresse a , bankverbindung ba , belegung b , ferienwohnung f , kunde k 
    where k.adressid = a.adressid 
    and k.kundennr = b.kundennr
    and k.iban = ba.iban 
    and b.ferienwohnungid = f.ferienwohnungid
    ;


--4.4 Zahlungsstatus
-- bezahlt oder nicht bezahlt ausgeben alle kunden die buchungen haben ausgeben 
    create view Zahlungsstatus as
    Select k.nachname, b.*, f.beschreibung,  r.rechnungsnr, r.zahlungseingang,
    case when r.zahlungseingang is null then 'offen' else 'bezahlt' end as Zahlungsstatus
    from  ferienwohnung f, Kunde k, (Rechnung r RIGHT OUTER JOIN Buchung b ON b.Belegnr = r.Belegnr)
    WHERE b.ferienwohnungid = f.ferienwohnungid
    AND b.Kundennr = k.kundennr;
     
  
--4.5 MidAgeKunden
create view MidageKunden as
    SELECT k.* ,TRUNC(TO_NUMBER(SYSDATE - geburtsdatum) / 365.25) AS age
    FROM kunde k
    where TRUNC(TO_NUMBER(SYSDATE - geburtsdatum) / 365.25) between 30 and 40
    order by age;
    
--test

update kunde
set geburtsdatum = '01.01.1991'
where kundennr = '3' ;

commit;
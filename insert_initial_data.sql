--Datum an Tag.Monat.Jahr anpassen
ALTER SESSION set NLS_DATE_FORMAT='DD.MM.YYYY';



--Bankverbindung
insert into Bankverbindung(IBAN , Kontonummer , BLZ)
values ('DE692717237823212','7823212','69271723');
insert into Bankverbindung(IBAN , Kontonummer , BLZ)
values ('DE3279396838929368','8929368','32793968');
insert into Bankverbindung(IBAN , Kontonummer , BLZ)
values ('DE6927172331347291','1347291','69271723');
insert into Bankverbindung(IBAN , Kontonummer , BLZ)
values ('DE297884318792978','8792978','29788431');
insert into Bankverbindung(IBAN , Kontonummer , BLZ)
values ('DE878902719082780','9082780','87890271');
insert into Bankverbindung(IBAN , Kontonummer , BLZ)
values ('DE692717237322890','7322890','69271723');

--Zusatzausstattung
insert into Zusatzausstattung(ausstattungid)
values('Schwimmbad');
insert into Zusatzausstattung(ausstattungid)
values('Sauna');
insert into zusatzausstattung(ausstattungid)
values('Autoabstellplatz');
insert into zusatzausstattung(ausstattungid)
values('Aufzug');
insert into zusatzausstattung(ausstattungid)
values('Kinderbetreuung');
insert into zusatzausstattung(ausstattungid)
values('SatTV');
insert into zusatzausstattung(ausstattungid)
values('Reinigung');
insert into zusatzausstattung(ausstattungid)
values('Dachterrasse');
insert into zusatzausstattung(ausstattungid)
values('Garage');

--Fluggesellschaft
insert into Fluggesellschaft(fluggesellschaftsid, rating)
values('Lufthansa', 1);
insert into Fluggesellschaft(fluggesellschaftsid, rating)
values('German Wings', 4);
insert into Fluggesellschaft(fluggesellschaftsid, rating)
values('Thomas Cook', 8);
insert into Fluggesellschaft(fluggesellschaftsid, rating)
values('Hapag Lloyd', 9);
insert into Fluggesellschaft(fluggesellschaftsid, rating)
values('Swiss', 8);

--Land
insert into Land(ISO_Code , LandName)
values('DE' , 'Deutschland');
insert into Land(ISO_Code , LandName)
values('CH' , 'Schweiz');
insert into Land(ISO_Code , LandName)
values('TR' , 'Tuerkei');
insert into Land(ISO_Code , LandName)
values('FR','Frankreich');
insert into Land(ISO_Code , LandName)
values('ES','Spanien');
insert into Land(ISO_Code , LandName)
values('GL','Groenland');

--Ort
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(1,'Konstanz','DE',1);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(2,'Stuttgart','DE',1);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(3,'Heidelberg','DE',1);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(4,'Rust','DE',1);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(5,'Bern','CH',3);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(6,'Zuerich','CH',3);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(7,'Chur','CH',3);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(8,'Flims-Laax','CH',3);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(9,'Oeludeniz','TR',2);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(10,'Antalya','TR',2);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(11,'Bordequx','FR',4);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(12,'Paris','FR',4);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(13,'Disneyland','FR',4);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(14,'Barcelona','ES',5);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(15,'Frankfurt','DE',1);
insert into Ort(OrtsID , OrtName , ISO_Code,flughafenid )
values(16,'Istanbul','TR',2);

--Adresse
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(1,'Reutestr.',78647,'104',1);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(2,'Hauptstr.',69115,'12',3);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(3,'Schlossstr.',70173,'54',2);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(4,'Alpenstr',3001,'11',5);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(5,'Seeweg',8001,'23',6);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(6,'Rheingutstr.',78642,'14',1);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(7,'Highway',2349,'5',9);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(8,'Markgrafenstr.',78461,'33',1);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(9,'Zur Piste',2234,'189',7);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(10,'rue Monsieur',8234,'980',11);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(11,'rue de Gaulle',8787,'22',13);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(12,'rue de la Maison Blanche',8792,'32',12);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(13,'rue liberte',8792,'78',12);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(14,'Strandweg',2321,'90',10);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(15,'Strandweg',2321,'91',10);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(16,'Calle del torro',5221,'821',14);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(17,'Strandweg',2321,'45',10);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(18,'Europapark',78231,'1',4);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(19,'Seestr.',78463,'12',1);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(20,'Bergweg',2371,'78',8);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(21,'GreenOne',1352,'29',6);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(22,'rue de Gaulle',8787,'22',13);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(23,'Am Flughafen',60541,'2',15);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(24,'Sabiha Goekcen',1452,'1',16);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(25,'Flughafen-Allee',5098,'100',6);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(26,'Charles de Gaulle',8792,'1',12);
insert into Adresse(AdressID, Strasse, PLZ, Hausnummer, OrtsID)
values(27,'Aeroporto de Barcelona',08820,'10',14);

--Flughafen
insert into Flughafen (FlughafenID ,FlughafenName, AdressID)
values(1 ,'Frankfurt', 23);
insert into Flughafen (FlughafenID ,FlughafenName, AdressID)
values(2 ,'Istanbul', 24);
insert into Flughafen (FlughafenID ,FlughafenName, AdressID)
values(3 ,'Zuerich', 25);
insert into Flughafen (FlughafenID ,FlughafenName, AdressID)
values(4 ,'Paris', 26);
insert into Flughafen (FlughafenID ,FlughafenName, AdressID)
values(5 ,'Barcelona', 27);

--Ferienwohnung
insert into Ferienwohnung(FerienwohnungID , Preis , AnzahlZimmer, Groesse , Beschreibung , AdressID)
values(1, 349.00 , 06.0 , 200 , 'Finka', 7);
insert into Ferienwohnung(FerienwohnungID , Preis , AnzahlZimmer, Groesse , Beschreibung , AdressID)
values(2, 120.00 , 02.0 , 45 , 'Ferienwohnung mit Seeblick', 8);
insert into Ferienwohnung(FerienwohnungID , Preis , AnzahlZimmer, Groesse , Beschreibung , AdressID )
values(3, 249.00 , 03.0 , 150 , 'im Schnee', 9 );
insert into Ferienwohnung(FerienwohnungID , Preis , AnzahlZimmer, Groesse , Beschreibung , AdressID )
values(4, 249.00 , 04.0 , 100 , 'direkt am Meer', 10 );
insert into Ferienwohnung(FerienwohnungID , Preis , AnzahlZimmer, Groesse , Beschreibung , AdressID )
values(5, 289.00 , 03.0 , 110 , 'direkt am Park', 11 );
insert into Ferienwohnung(FerienwohnungID , Preis , AnzahlZimmer, Groesse , Beschreibung , AdressID )
values(6, 549.00 , 02.0 , 70 , 'mit Blick auf Eiffelturm', 12 );
insert into Ferienwohnung(FerienwohnungID , Preis , AnzahlZimmer, Groesse , Beschreibung , AdressID )
values(7, 159.00 , 06.0 , 110 , 'Dachterrassenwohnung zantral', 13 );
insert into Ferienwohnung(FerienwohnungID , Preis , AnzahlZimmer, Groesse , Beschreibung , AdressID )
values(8, 240.00 , 12.0 , 200 , 'zweigeschossiges Haus', 14 );
insert into Ferienwohnung(FerienwohnungID , Preis , AnzahlZimmer, Groesse , Beschreibung , AdressID )
values(9, 159.00 , 05.0 , 111 , 'Topvilla am Strand', 15 );
insert into Ferienwohnung(FerienwohnungID , Preis , AnzahlZimmer, Groesse , Beschreibung , AdressID )
values(10, 299.00 , 04.0 , 100 , 'Ferienhaus am Strand', 16 );
insert into Ferienwohnung(FerienwohnungID , Preis , AnzahlZimmer, Groesse , Beschreibung , AdressID )
values(11, 150.00 , 04.0 , 100 , 'Strandbungalow', 17 );

--Bild
insert into Bild(BildID , Beschreibung , Dateipfad , FerienwohnungID)
values(1 , 'Aussenansicht' , '1_1.jpg' , 1);
insert into Bild(BildID , Beschreibung , Dateipfad , FerienwohnungID)
values(2 , 'Innenansicht' , '1_2.jpg' , 1);
insert into Bild(BildID , Beschreibung , Dateipfad , FerienwohnungID)
values(3 , 'Aussenansicht' , '2_1.jpg' , 2);
insert into Bild(BildID , Beschreibung , Dateipfad , FerienwohnungID)
values(4 , 'Innenansicht' , '2_2.jpg' , 2);
insert into Bild(BildID , Beschreibung , Dateipfad , FerienwohnungID)
values(5 , 'Garage' , '5_1.gif' , 5);
insert into Bild(BildID , Beschreibung , Dateipfad , FerienwohnungID)
values(6 , 'Dachterasse' , '8.jpg' , 8);

--Touristenattraktion
insert into Touristenattraktion(TouristenattraktionID , Beschreibung , AdressID)
values(1 , 'Freizeitpark Deutschlads Nr.1' ,18 );
insert into Touristenattraktion(TouristenattraktionID , Beschreibung , AdressID)
values(2 , 'Badestrand Bodensee-Strand' ,19 );
insert into Touristenattraktion(TouristenattraktionID , Beschreibung , AdressID)
values(3 , 'Skigebiet' ,20 );
insert into Touristenattraktion(TouristenattraktionID , Beschreibung , AdressID)
values(4 , 'Golfplatz' ,21 );
insert into Touristenattraktion(TouristenattraktionID , Beschreibung , AdressID)
values(5 , 'Freizeitpark' ,22 );

--Kunde
insert into Kunde(KundenNr, Geburtsdatum, Nachname, Vorname, Telefonnummer, AdressID, IBAN, email)
values('1','01.01.1960', 'Napf', 'Karl', '07531-123456',1,'DE692717237823212','knapf@gmx.de');
insert into Kunde(KundenNr, Geburtsdatum, Nachname, Vorname, Telefonnummer, AdressID, IBAN, email)
values('2','02.01.1975', 'Meier', 'Hans', '06221-999888',2,'DE3279396838929368','meiers.hans@t-online.de');
insert into Kunde(KundenNr, Geburtsdatum, Nachname, Vorname, Telefonnummer, AdressID, IBAN, email)
values('3','03.01.1980', 'Huber', 'Franz', '0711-554673',3,'DE6927172331347291','huber@t-online.de');
insert into Kunde(KundenNr, Geburtsdatum, Nachname, Vorname, Telefonnummer, AdressID, IBAN, email)
values('4','04.01.1985', 'Eber', 'Klaus', '+41-171-9864785',4,'DE297884318792978','eber@bluewin.ch');
insert into Kunde(KundenNr, Geburtsdatum, Nachname, Vorname, Telefonnummer, AdressID, IBAN, email)
values('5','05.01.1990', 'Meier', 'Egon', '+41-171-9864785',5,'DE878902719082780','meier@gmail. com');
insert into Kunde(KundenNr, Geburtsdatum, Nachname, Vorname, Telefonnummer, AdressID, IBAN, email)
values('6','06.01.1995', 'Knopf', 'Jim', '0171-9876543',6,'DE692717237322890','jim.knopf@gmx.net');


--Belegung
insert into Belegung(BelegNr, Buchungsdatum, Status, von, bis, FerienwohnungID, KundenNr)
values('1','12.02.2016','verbindlich','11.03.2016','13.03.2016',4,'2');
insert into Belegung(BelegNr, Buchungsdatum, Status, von, bis, FerienwohnungID, KundenNr)
values('2','13.03.2016','unverbindlich','11.05.2016','17.05.2016',5,'2');
insert into Belegung(BelegNr, Buchungsdatum, Status, von, bis, FerienwohnungID, KundenNr)
values('3','10.02.2016','unverbindlich','03.04.2016','23.04.2016',5,'3');
insert into Belegung(BelegNr, Buchungsdatum, Status, von, bis, FerienwohnungID, KundenNr)
values('4','09.02.2016','verbindlich','04.07.2016','05.07.2016',6,'4');
insert into Belegung(BelegNr, Buchungsdatum, Status, von, bis, FerienwohnungID, KundenNr)
values('5','14.02.2016','unverbindlich','28.04.2016','02.05.2016',10,'2');
insert into Belegung(BelegNr, Buchungsdatum, Status, von, bis, FerienwohnungID, KundenNr)
values('6','18.02.2016','verbindlich','04.05.2016','22.05.2016',8,'3');
insert into Belegung(BelegNr, Buchungsdatum, Status, von, bis, FerienwohnungID, KundenNr)
values('7','01.02.2016','verbindlich','07.05.2016','08.05.2016',2,'1');
insert into Belegung(BelegNr, Buchungsdatum, Status, von, bis, FerienwohnungID, KundenNr)
values('8','11.02.2016','verbindlich','22.05.2016','28.05.2016',9,'5');
insert into Belegung(BelegNr, Buchungsdatum, Status, von, bis, FerienwohnungID, KundenNr)
values('9','07.02.2016','verbindlich','03.07.2016','08.07.2016',10,'5');
insert into Belegung(BelegNr, Buchungsdatum, Status, von, bis, FerienwohnungID, KundenNr)
values('10','10.02.2016','unverbindlich','01.05.2016','24.05.2016',1,'4');

--Rechnung
insert into Rechnung(Rechnungsnr, Datum, Betrag, Zahlungseingang, BelegNr)
values(1, '15.03.2016', 498.00, '18.03.2016', 1);
insert into Rechnung(Rechnungsnr, Datum, Betrag, Zahlungseingang, BelegNr)
values(2, '26.02.2016', 549.00,'', 4);

--fliegt
insert into fliegt(FluggesellschaftsID , Start_Flughafen , Ziel)
values('Lufthansa','Frankfurt' , 'Barcelona');
insert into fliegt(FluggesellschaftsID , Start_Flughafen , Ziel)
values('German Wings','Frankfurt' , 'Istanbul');
insert into fliegt(FluggesellschaftsID , Start_Flughafen , Ziel)
values('German Wings','Frankfurt' , 'Paris');
insert into fliegt(FluggesellschaftsID , Start_Flughafen , Ziel)
values('Lufthansa','Frankfurt' , 'Paris');
insert into fliegt(FluggesellschaftsID , Start_Flughafen , Ziel)
values('Thomas Cook','Frankfurt' , 'Paris');
insert into fliegt(FluggesellschaftsID , Start_Flughafen , Ziel)
values('Thomas Cook','Istanbul' , 'Barcelona');
insert into fliegt(FluggesellschaftsID , Start_Flughafen , Ziel)
values('Hapag Lloyd','Paris' , 'Barcelona');
insert into fliegt(FluggesellschaftsID , Start_Flughafen , Ziel)
values('German Wings','Paris' , 'Zuerich');

--ergibtEntferung
insert into ergibtEntfernung(Ort1 , Ort2 , km )
values(1 ,4, 180);
insert into ergibtEntfernung(Ort1 , Ort2 , km )
values(7 ,6, 120);
insert into ergibtEntfernung(Ort1 , Ort2 , km )
values(7 ,8, 40);
insert into ergibtEntfernung(Ort1 , Ort2 , km )
values(11 ,13, 420);
insert into ergibtEntfernung(Ort1 , Ort2 , km )
values(12 ,13, 30);
--insert into ergibtEntfernung(Ort1 , Ort2 , km )
--values(12 ,13, 30);

--hat
insert into hat(FerienwohnungID, ausstattungid)
    Values(1, 'Schwimmbad');
insert into hat(FerienwohnungID, ausstattungid)
    Values(1, 'Sauna');
insert into hat(FerienwohnungID, ausstattungid)
    Values(2, 'Aufzug');
insert into hat(FerienwohnungID, ausstattungid)
    Values(2, 'Autoabstellplatz');
insert into hat(FerienwohnungID, ausstattungid)
    Values(3, 'Sauna');
insert into hat(FerienwohnungID, ausstattungid)
    Values(5, 'Kinderbetreuung');
insert into hat(FerienwohnungID, ausstattungid)
    Values(5, 'Schwimmbad');
insert into hat(FerienwohnungID, ausstattungid)
    Values(6, 'Schwimmbad');
insert into hat(FerienwohnungID, ausstattungid)
    Values(7, 'Schwimmbad');
insert into hat(FerienwohnungID, ausstattungid)
    Values(8, 'SatTV');
insert into hat(FerienwohnungID, ausstattungid)
    Values(8, 'Reinigung');
insert into hat(FerienwohnungID, ausstattungid)
    Values(8, 'Dachterrasse');
insert into hat(FerienwohnungID, ausstattungid)
    Values(9, 'Garage');
insert into hat(FerienwohnungID, ausstattungid)
    Values(9, 'Schwimmbad');
insert into hat(FerienwohnungID, ausstattungid)
    Values(11, 'Schwimmbad');

commit;

--delete from belegung;
commit;
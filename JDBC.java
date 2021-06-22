import java.sql.*;

public class JDBC {

    private static Connection theConnection = null;

    public static void main(String[] args) {
        System.out.println();
        System.out.println(">>> Starting DBIS JDBC sample program ... <<<<<<<<<<<<");
        System.out.println();


        //enable debug output
        DBISUtils.setDebugFlag(true);


        //connect to DBS instance
        try {

            theConnection = DBISUtils.getConnection();

        } catch (SQLException se) {

            System.out.println();
            System.out.println("An error occurred while establishing connection to DBS:");

            DBISUtils.decodeAndPrintAllSQLExceptions(se);

            System.out.println();
            System.out.println("### Exiting DBIS JDBC sample program with failure! ###");
            System.out.println();

            System.exit(-1);

        }

        System.out.println();
        showTopMenu();



    }

    private static void showTopMenu() {

        while (true) {

            System.out.println();
            System.out.println("Welche Operation wollen Sie durchfuehren ?");
            System.out.println("-----------------------------------------");

            System.out.println("1) Kunde hinzufuegen");
            System.out.println("2) Kunde suchen");
            System.out.println("3) space holder");
            System.out.println("4) space holder");
            System.out.println("5) Exit");
            System.out.println();

            int theChoice = DBISUtils.readIntFromStdIn("Option");

            System.out.println();

            switch (theChoice) {

                case 1:
                    addKunde();
                    break;

//                case 2:
//                    showKunde();
//                    break;
//
//                case 3:
//                    spaceHolder1();
//                    break;
//
//                case 4:
//                    spaceHolder2();
//                    break;

                case 5:
                    System.out.println();
                    System.out.println();
                    System.out.println("Programm beenden ...");
                    return;

                default:
                    System.out.println(theChoice + " ist keine gueltige Option!");
                    break;

            }

            System.out.println();
            System.out.println();

        }

    }



    private static void addKunde() {



        try {

            Statement stmt = theConnection.createStatement();
            Statement ort = theConnection.createStatement();
                    System.out.println("Kunde hinzufuegen");
            System.out.println("-----------------------------------------");

            System.out.println("Daten des Kunden:");
           // int newsql = DBISUtils.readIntFromStdIn("KundenNR");
            String newGebDatum = DBISUtils.readDateFromStdIn("Geburtsdatum (Format DD.MM.YYYY)");
            String newName = DBISUtils.readFromStdIn("Nachname");
            String newVorname = DBISUtils.readFromStdIn("Vorname");
            String newPhone = DBISUtils.readFromStdIn("Telefonnummer");
            String sqlLocation ="SELECT DISTINCT O.ORTSID,O.ORTNAME "
                                +"FROM ORT O " +
                                 "ORDER BY O.ORTSID";
            ResultSet rs = ort.executeQuery(sqlLocation);
            while(rs.next()) {
                System.out.println("ORTSID: "+ rs.getString(1) + " ist Wohnort in " +
                                    rs.getString(2));
            }
            System.out.println("Bitte geben Sie ORTSID als Wohnort ein!");
            String newOrt = DBISUtils.readFromStdIn("Wohnort");
            //String newAdress = stmt.executeQuery(insert into Adresse(AdressID)  values (max(Adressid)+1));
            String newStrasse = DBISUtils.readFromStdIn("Strasse");
            String newPLZ = DBISUtils.readFromStdIn("PLZ");
            String newHS = DBISUtils.readFromStdIn("Hausnummer");
            String newIban = DBISUtils.readFromStdIn("IBAN 22 Zeichen");
            String newKonto = DBISUtils.readFromStdIn("Kontonummer 10 Zeichen");
            String newBLZ = DBISUtils.readFromStdIn("BLZ 8 Zeichen");
            String newBIC = DBISUtils.readFromStdIn("BIC 11 Zeichen");
            String newMail = DBISUtils.readFromStdIn("Email");



            //*** example of using a JDBC statement for for INSERT / UPDATE / DELETE ***
           String sqlMaxKundenID = "SELECT MAX(KundenNr) + 1 "
                   + "FROM Kunde";
            ResultSet maxKunde = stmt.executeQuery(sqlMaxKundenID);

            String sqlMaxAdressID = "SELECT MAX(AdressID) "
                    + "FROM ADRESSE";
            ResultSet maxvalue = stmt.executeQuery(sqlMaxAdressID);


            String sqlStringKunde = "INSERT INTO Kunde (KundenNR, Geburtsdatum, Nachname, Vorname, Telefonnummer, AdressID, Iban, email) " +
                    "VALUES (" + maxKunde + ", '" + newGebDatum + "', '" + newName + "', '" + newVorname + "', '" + newGebDatum +"', '"+newPhone+"', '"+ maxvalue +1
                    +"', '"+newIban+"', '"+newMail+ "')";

            String sqlStringAdresse = "INSERT INTO Adresse (AdressID, Strasse, PLZ, Hausnummer, Ortsid) " +
                    "VALUES (" + maxvalue +1 +", '" + newStrasse + "', '" + newPLZ + "', '" + newHS + "', '" + newOrt+ "')";

            String sqlStringBankverbindung = "INSERT INTO Bankverbindung (IBAN, Kontonummer, BLZ, BIC) " +
            "VALUES (" + newIban + ", '" + newKonto + "', '" + newBLZ + "', '" + newBIC + "')";

            DBISUtils.printlnDebugInfo("SQL statement is:");
            DBISUtils.printlnDebugInfo(sqlStringKunde);
            DBISUtils.printlnDebugInfo(sqlStringAdresse);
            DBISUtils.printlnDebugInfo(sqlStringBankverbindung);
            DBISUtils.printlnDebugInfo(sqlMaxAdressID);

            int affectedRows = stmt.executeUpdate(sqlStringKunde);
            int affectedRows2 = stmt.executeUpdate(sqlStringAdresse);
            int affectedRows3 = stmt.executeUpdate(sqlStringBankverbindung);
            int affectedRows4 = stmt.executeUpdate(sqlMaxAdressID);

            //commit the transaction
           // theConnection.commit();

            //DBISUtils.printlnDebugInfo();
            DBISUtils.printlnDebugInfo("Transaction committed!");

            System.out.println();

            if (affectedRows == 1) {
                System.out.println("Der Kunde mit KundenNr " + maxkunde + " wurde hinzugefuegt.");
            } else {
                System.out.println("Der Kudne mit KundenNr " + maxkunde + " konnte nicht hinzugefuegt werden.");
            }
            theConnection.commit();
            stmt.close();

        } catch (SQLException se) {

            DBISUtils.decodeAndPrintAllSQLExceptions(se);

            try {

                //abort the transaction
                theConnection.rollback();

                System.out.println("");
                System.out.println("Transaction rolled back!");

            } catch (SQLException e) {

                DBISUtils.decodeAndPrintAllSQLExceptions(se);

            }

        }

    }





}

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class Databaseconnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "BloodBank");

    var database =
        await openDatabase(path, version: 1, onCreate: BloodbankTable);
    return database;
  }

  Future<void> BloodbankTable(Database database, int version) async {
    String BloodBank =
        "create table Bloodbank( Donor_ID INTEGER PRIMARY key AUTOINCREMENT, Donor_Name text, Blood_Group text, Age INTEGER,Contact_no INTEGER, Address text,Email_ID text )";
    await database.execute(BloodBank);

    String RequestBank =
        "create table RequestBank(id INTEGER PRIMARY key AUTOINCREMENT, name text, blood text, age INTEGER,contact INTEGER, address text,hospital text,Quantity INTEGER,Bags INTEGER, Purpose INTEGER  )";
    await database.execute(RequestBank);
  }
}

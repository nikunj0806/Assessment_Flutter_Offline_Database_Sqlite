import 'package:practicdatabase/DatabaseConnection.dart';
import 'package:sqflite/sqflite.dart';

class Repositor {
  late Databaseconnection databaseconnection;

  Repositor() {
    databaseconnection = Databaseconnection();
  }

  static Database? database;

  Future<Database?> get myAdminData async {
    if (database != null) {
      return database;
    } else {
      database = await databaseconnection.setDatabase();
      return database;
    }
  }

  insertData(tablename, Data) async {
    var con = await myAdminData;
    return await con!.insert(tablename, Data);
  }

  readData(tablename) async {
    var con = await myAdminData;
    return await con!.query(tablename);
  }

  readSignData(tablename, Donor_ID) async {
    var con = await myAdminData;
    return await con!.query(tablename, where: "Donor_ID = ?", whereArgs: [Donor_ID]);
  }

  updateData(tablename, Data) async {
    var con = await myAdminData;
    return await con!
        .update(tablename, Data, where: "Donor_ID = ?", whereArgs: [Data["Donor_ID"]]);
  }

  deleteData(tablename, Data) async {
    var con = await myAdminData;
    return await con!
        .delete(tablename, where: "Donor_ID = ? ", whereArgs: [Data["Donor_ID"]]);
  }
}

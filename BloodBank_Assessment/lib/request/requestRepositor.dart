import 'package:practicdatabase/DatabaseConnection.dart';
import 'package:sqflite/sqflite.dart';

class Requestrepositor {
  late Databaseconnection databaseconnection;

  Requestrepositor() {
    databaseconnection = Databaseconnection();
  }

  static Database? database;

  Future<Database?> get myRequestData async {
    if (database != null) {
      return database;
    } else {
      database = await databaseconnection.setDatabase();
      return database;
    }
  }

  insertData(tablename, Data) async {
    var con = await myRequestData;
    return await con!.insert(tablename, Data);
  }

  readData(tablename) async {
    var con = await myRequestData;
    return await con!.query(tablename);
  }

  readSignData(tablename, id) async {
    var con = await myRequestData;
    return await con!.query(tablename, where: "id = ?", whereArgs: [id]);
  }

  updateData(tablename, Data) async {
    var con = await myRequestData;
    return await con!
        .update(tablename, Data, where: "id = ?", whereArgs: [Data["id"]]);
  }

  deleteData(tablename, Data) async {
    var con = await myRequestData;
    return await con!
        .delete(tablename, where: "id = ? ", whereArgs: [Data["id"]]);
  }
}

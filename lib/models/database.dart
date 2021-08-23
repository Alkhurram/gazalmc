import 'dart:async';

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gazal/models/users.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "UserDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE User ("
          "id INTEGER PRIMARY KEY,"
          "firstName TEXT,"
          "lastName TEXT,"
          "phone TEXT,"
          "email TEXT,"
          "password TEXT"
          ")");

      // await db.execute(
      //     "INSERT INTO User('id','firstName','lastName','phone','email','password') values (?, ?, ?, ?, ?,?)",
      //     [1, "khurram", "shahid", "sdffsdfs", "alkhurram", "TheWorld"]);
    });
  }



  Future<List<User>> getAllUsers() async {
    final db = await database;
    List<Map> results =
        await db.query("User", columns: User.columns, orderBy: "id ASC");

    List<User> users = new List();
    results.forEach((result) {
      User user = User.fromMap(result);
      users.add(user);
    });
    return users;
  }


  Future<List<User>> getAllUsersNew() async {
    final db = await database;
    List<Map> results =
    await db.query("User", columns: User.columns, orderBy: "id ASC");

    List<User> users = new List();
    results.forEach((result) {
      User user = User.fromMap(result);
      users.add(user);
    });
    return users;
  }


  Future<List<User>> getAllUsersbyId() async {
    final db = await database;
    List<Map> results =
        await db.query("User", columns: User.columns, orderBy: "id ASC");
    List<User> users = new List();
    results.forEach((result) {
      User user = User.fromMap(result);
      users.add(user);
    });
    return users;
  }

  Future<User> getUserById(int id) async {
    final db = await database;
    var result = await db.query("User", where: "id = ", whereArgs: [id]);
    return result.isNotEmpty ? User.fromMap(result.first) : Null;
  }

  insert(int id, String firstName, String lastName, String phone, String email,
      String password) async {
    final db = await database;
    // var maxIdResult =
    //     await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM User");
    // var id = maxIdResult.first["last_inserted_id"];
    var result = await db.rawInsert(
        "INSERT Into User (id,firstName ,lastName,phone, email, password)"
        " VALUES (?, ?, ?, ?, ?,?)",
        [
          id,
          firstName,
          lastName,
          phone,
          email,
          password,
        ]);
    return result;
  }

  User user;
  update(id, firstName, lastName, phone, email, password) async {
    final db = await database;
    user.firstName = firstName;
    user.lastName = lastName;
    user.phone = phone;
    user.email = email;
    user.password = password;

    var result = await db
        .update("User", user.toJson(), where: "id = ?", whereArgs: id);
    return result;
  }

  delete(int id) async {
    final db = await database;
    db.delete("User", where: "id = ?", whereArgs: [id]);
  }
}

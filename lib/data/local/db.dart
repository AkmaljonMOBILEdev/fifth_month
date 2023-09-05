import 'package:fifth_month/data/models/user_fields.dart';
import 'package:fifth_month/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("users.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER NOT NULL";

    await db.execute('''
    CREATE TABLE ${UserFields.userTable} (
    ${UserFields.id} $idType,
    ${UserFields.firstname} $textType,
    ${UserFields.lastname} $textType,
    ${UserFields.age} $intType,
    ${UserFields.gender} $textType,
    ${UserFields.job} $textType
    )
    ''');

    debugPrint("-------DB----------CREATED---------");
  }

  static Future<UserModel> insertUser(
      UserModel userModel) async {
    debugPrint("Asserting: ${userModel.firstname}");
    final db = await getInstance.database;
    final int id = await db.insert(
        UserFields.userTable, userModel.toJson());
    return userModel.copyWith(id: id);
  }

  static updateUser({required UserModel newUser}) async {
    final db = await getInstance.database;
    db.update(UserFields.userTable,
      newUser.toJson(),
      where: "${UserFields.id} = ?",
      whereArgs: [newUser.id],
    );
  }

  static Future<int> deleteContact(int id) async {
    final db = await getInstance.database;
    int count = await db.delete(UserFields.userTable,
        where: "${UserFields.id} = ?",
        whereArgs: [id]
    );
    return count;
  }

  static Future<List<UserModel>> getAllUsers() async {
    List<UserModel> allUsers = [];
    final db = await getInstance.database;
    allUsers = (await db.query(UserFields.userTable))
        .map((e) => UserModel.fromJson(e))
        .toList();
    return allUsers;
  }


}

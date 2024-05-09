import 'dart:developer';

import 'package:panmasterapp/common/app_constants.dart';
import 'package:panmasterapp/common/app_sqlite_constants.dart';
import 'package:panmasterapp/common/app_toast.dart';
import 'package:panmasterapp/model/password/password.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class AppSqliteDbManager {
  static final AppSqliteDbManager _instance = AppSqliteDbManager.internal();
  factory AppSqliteDbManager() => _instance;
  AppSqliteDbManager.internal();

  static Database? _database;

  Future<Database> _initDB() async {
    String databasePath = await getDatabasesPath();
    String databaseFilePath = path.join(databasePath, "panmasterApp.db");
    return await openDatabase(
      databaseFilePath,
      version: AppConstants.databaseVersion,
      onCreate: (Database db, int version) async {
        // Change this accordingly based on [AppConstants.databaseVersion].
        await db.execute(AppSqliteConstant.createFileSettingsTable);
        await db.execute(AppSqliteConstant.createPasswordsTable);
      },
      onUpgrade: (Database db, int versionOld, int versionNew) async {
        // Change this accordingly based on [AppConstants.databaseVersion].
        await db.execute(AppSqliteConstant.createPasswordsTable);
      },
    );
  }

  Future<Database?> get database async {
    if (_database != null) { return _database; }
    _database = await _initDB();
    return _database;
  }

  Future<bool> initializeDatabase() async {
    try {
      Database? db = await database;
      if (db != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // ~~~~~~~~~~~~~~~~~~~ File Settings Section ~~~~~~~~~~~~~~~~~~~
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // ~~~~~~~~~~~~~~~~~~~ Passwords Section ~~~~~~~~~~~~~~~~~~~
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Future<List<Password>> getAllPasswords() async {
    final Database? db = await database;
    List<Password> passwords = [];
    if (db == null) {
      return passwords;
    }

    List<Map> passwordMaps = await db.query(AppSqliteConstant.dbPasswordsTable);
    for (Map passwordMap in passwordMaps) {
      Password password = Password.fromSQLiteJson(passwordMap);
      passwords.add(password);
    }
    return passwords;
  }

  Future<List<Password>> getPasswordsByDescription({required String description}) async {
    final Database? db = await database;
    List<Password> passwords = [];
    if (db == null) {
      return passwords;
    }

    List<Map> passwordMaps = await db.query(
      AppSqliteConstant.dbPasswordsTable,
      where: "${AppSqliteConstant.keyPasswordsPasswordDescription} LIKE ?",
      whereArgs: <dynamic>[description],
    );
    for (Map passwordMap in passwordMaps) {
      Password password = Password.fromSQLiteJson(passwordMap);
      passwords.add(password);
    }
    return passwords;
  }

  Future<bool> insertPassword({required Password password}) async {
    try {
      final Database? db = await database;
      if (db == null) {
        throw Exception("Database cannot be found.");
      }

      await db.insert(AppSqliteConstant.dbPasswordsTable, password.toSQLiteJson(),);
      return true;
    } catch (e) {
      log("ADD PASSWORD ERROR: ${e.toString()}");
      AppToast.showErrorToast(msg: "ADD PASSWORD ERROR: ${e.toString()}");
      return false;
    }
  }

  Future<bool> editPassword({required Password password}) async {
    try {
      final Database? db = await database;
      if (db == null) {
        throw Exception("Database cannot be found.");
      }

      await db.update(
        AppSqliteConstant.dbPasswordsTable,
        password.toSQLiteJson(),
        where: "${AppSqliteConstant.keyPasswordsPasswordId} = ?",
        whereArgs: <dynamic>[password.passwordId],
      );
      return true;
    } catch (e) {
      log("EDIT PASSWORD ERROR: ${e.toString()}");
      AppToast.showErrorToast(msg: "EDIT PASSWORD ERROR: ${e.toString()}");
      return false;
    }
  }

  Future<bool> deletePassword({required Password password}) async {
    try {
      final Database? db = await database;
      if (db == null) {
        throw Exception("Database cannot be found.");
      }

      await db.delete(
        AppSqliteConstant.dbPasswordsTable,
        where: "${AppSqliteConstant.keyPasswordsPasswordId} = ?",
        whereArgs: <dynamic>[password.passwordId],
      );
      return true;
    } catch (e) {
      log("DELETE PASSWORD ERROR: ${e.toString()}");
      AppToast.showErrorToast(msg: "DELETE PASSWORD ERROR: ${e.toString()}");
      return false;
    }
  }

}
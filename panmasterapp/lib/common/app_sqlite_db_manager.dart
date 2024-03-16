import 'package:panmasterapp/common/app_constants.dart';
import 'package:panmasterapp/common/app_sqlite_constants.dart';
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
        // Change this accordingly based on [AISBConstants.databaseVersion].
        await db.execute(AppSqliteConstant.createdFileSettingsTable);
      },
      onUpgrade: (Database db, int versionOld, int versionNew) async {
        // Change this accordingly based on [AISBConstants.databaseVersion].
        await db.execute(AppSqliteConstant.createdFileSettingsTable);
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


}
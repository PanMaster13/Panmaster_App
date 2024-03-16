class AppConstants {

  /// Represents the version number of the SQFLite Local Database.
  ///
  /// Changing this number will call the [openDatabase.onUpgrade] function in [AISBSqliteDbManager._initDB].
  /// Please keep a change log of what is changed in the database for each version.
  ///
  /// Version 1: File Settings Table Creation.
  ///
  /// Version 2: ???
  static int databaseVersion = 1;
}
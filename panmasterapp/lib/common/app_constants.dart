class AppConstants {

  /// Represents the version number of the SQFLite Local Database.
  ///
  /// Changing this number will call the [openDatabase.onUpgrade] function in [AISBSqliteDbManager._initDB].
  /// Please keep a change log of what is changed in the database for each version.
  ///
  /// Version 1: File Settings Table Creation.
  ///
  /// Version 2: Passwords Table Creation.
  static const int databaseVersion = 2;

  static const int springMarchEquinoxDay = 21;

  static const int springMarchEquinoxMonth = 3;

  static const int summerJuneSolsticeDay = 22;

  static const int summerJuneSolsticeMonth = 6;

  static const int autumnSeptemberEquinoxDay = 23;

  static const int autumnSeptemberEquinoxMonth = 9;

  static const int winterDecemberSolsticeDay = 22;

  static const int winterDecemberSolsticeMonth = 12;
}
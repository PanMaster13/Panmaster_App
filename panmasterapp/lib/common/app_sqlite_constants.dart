class AppSqliteConstant {
  // Tables
  static const String dbFileSettingsTable = "[FileSettings]";
  static const String dbPasswordsTable = "[Passwords]";

  // File Settings Columns
  static const String keyFileSettingId = "[FileSettingId]";
  static const String keyFileSettingDescription = "[FileSettingDescription]";
  static const String keyFileSettingPath = "[FileSettingPath]";
  static const String keyFileSettingCreatedAt = "[FileSettingCreatedAt]";
  static const String keyFileSettingUpdatedAt = "[FileSettingUpdatedAt]";

  // Password Columns
  static const String keyPasswordsPasswordId = "[PasswordId]";
  static const String keyPasswordsLoginId = "[LoginId]";
  static const String keyPasswordsPassword = "[Password]";
  static const String keyPasswordsPasswordDescription = "[PasswordDescription]";
  static const String keyPasswordsCreatedAt = "[PasswordsCreatedAt]";
  static const String keyPasswordsUpdatedAt = "[PasswordsUpdatedAt]";

  // Create File Settings Columns
  static const String createFileSettingsTable = "CREATE TABLE IF NOT EXISTS $dbFileSettingsTable ("
      "$keyFileSettingId NVARCHAR(50) NOT NULL PRIMARY KEY, "
      "$keyFileSettingDescription NVARCHAR(100) NULL, "
      "$keyFileSettingPath TEXT NULL, "
      "$keyFileSettingCreatedAt INTEGER NULL, "
      "$keyFileSettingUpdatedAt INTEGER NULL);";

  // Create Password Columns
  static const String createPasswordsTable = "CREATE TABLE IF NOT EXISTS $dbPasswordsTable ("
      "$keyPasswordsPasswordId NVARCHAR(50) NOT NULL PRIMARY KEY, "
      "$keyPasswordsLoginId NVARCHAR(50) NULL, "
      "$keyPasswordsPassword TEXT NULL, "
      "$keyPasswordsPasswordDescription NVARCHAR(100) NULL, "
      "$keyPasswordsCreatedAt INTEGER NULL, "
      "$keyPasswordsUpdatedAt INTEGER NULL);";

}
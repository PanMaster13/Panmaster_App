class AppSqliteConstant {
  // Tables
  static const String dbFileSettingsTable = "[FileSettings]";

  // File Settings Columns
  static const String keyFileSettingId = "[FileSettingId]";
  static const String keyFileSettingDescription = "[FileSettingDescription]";
  static const String keyFileSettingPath = "[FileSettingPath]";
  static const String keyFileSettingCreatedAt = "[FileSettingCreatedAt]";
  static const String keyFileSettingUpdatedAt = "[FileSettingUpdatedAt]";

  // Create File Settings Columns
  static const String createdFileSettingsTable = "CREATE TABLE IF NOT EXISTS $dbFileSettingsTable ("
      "$keyFileSettingId NVARCHAR(50) NOT NULL PRIMARY KEY, "
      "$keyFileSettingDescription NVARCHAR(100) NULL, "
      "$keyFileSettingPath TEXT NULL, "
      "$keyFileSettingCreatedAt INTEGER NULL, "
      "$keyFileSettingUpdatedAt INTEGER NULL);";
}
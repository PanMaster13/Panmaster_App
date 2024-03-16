class FileSetting {
  String? fileSettingId;
  String? fileSettingDescription;
  String? fileSettingPath;
  DateTime? createdDateTime;
  DateTime? updatedDateTime;

  FileSetting({
    this.fileSettingId,
    this.fileSettingDescription,
    this.fileSettingPath,
    this.createdDateTime,
    this.updatedDateTime,
  });

  FileSetting.fromJson(Map<String, dynamic> json) {
    fileSettingId = json["fileSettingId"];
    fileSettingDescription = json["fileSettingDescription"];
    fileSettingPath = json["fileSettingPath"];
    createdDateTime = json["createdDateTime"];
    updatedDateTime = json["updatedDateTime"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String,dynamic>{};
    data["fileSettingId"] = fileSettingId;
    data["fileSettingDescription"] = fileSettingDescription;
    data["fileSettingPath"] = fileSettingPath;
    data["createdDateTime"] = createdDateTime.toString();
    data["updatedDateTime"] = updatedDateTime.toString();
    return data;
  }

  FileSetting.fromSQLiteJson(Map<dynamic, dynamic> json) {
    fileSettingId = json["FileSettingId"];
    fileSettingDescription = json["FileSettingDescription"];
    fileSettingPath = json["FileSettingPath"];
    createdDateTime = DateTime.fromMillisecondsSinceEpoch(json["FileSettingCreatedAt"]);
    updatedDateTime = DateTime.fromMillisecondsSinceEpoch(json["FileSettingUpdatedAt"]);
  }

  Map<String, dynamic> toSQLiteJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["FileSettingId"] = fileSettingId;
    data["FileSettingDescription"] = fileSettingDescription;
    data["FileSettingPath"] = fileSettingPath;
    data["StockCreatedDateTime"] = createdDateTime?.millisecondsSinceEpoch ?? 0;
    data["StockUpdatedDateTime"] = updatedDateTime?.millisecondsSinceEpoch ?? 0;
    return data;
  }
}
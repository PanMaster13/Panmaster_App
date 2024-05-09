class Password {
  String? passwordId;
  String? loginId;
  String? password;
  String? passwordDescription;
  DateTime? createdAt;
  DateTime? updatedAt;

  Password({
    this.passwordId,
    this.loginId,
    this.password,
    this.passwordDescription,
    this.createdAt,
    this.updatedAt,
  });

  Password.fromJson(Map<String, dynamic> json) {
    passwordId = json["passwordId"];
    loginId = json["loginId"];
    password = json["password"];
    passwordDescription = json["passwordDescription"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["passwordId"] = passwordId;
    data["loginId"] = loginId;
    data["password"] = password;
    data["passwordDescription"] = passwordDescription;
    data["createdAt"] = createdAt.toString();
    data["updatedAt"] = updatedAt.toString();
    return data;
  }

  Password.fromSQLiteJson(Map<dynamic, dynamic> json) {
    passwordId = json["PasswordId"];
    loginId = json["LoginId"];
    password = json["Password"];
    passwordDescription = json["PasswordDescription"];
    createdAt = DateTime.fromMillisecondsSinceEpoch(json["PasswordsCreatedAt"]);
    updatedAt = DateTime.fromMillisecondsSinceEpoch(json["PasswordsUpdatedAt"]);
  }

  Map<String, dynamic> toSQLiteJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["PasswordId"] = passwordId;
    data["LoginId"] = loginId;
    data["Password"] = password;
    data["PasswordDescription"] = passwordDescription;
    data["PasswordsCreatedAt"] = createdAt?.millisecondsSinceEpoch ?? 0;
    data["PasswordsUpdatedAt"] = updatedAt?.millisecondsSinceEpoch ?? 0;
    return data;
  }

}
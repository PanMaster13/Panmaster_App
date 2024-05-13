import 'dart:developer';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/common/app_id_generator.dart';
import 'package:panmasterapp/common/app_sqlite_db_manager.dart';
import 'package:panmasterapp/common/enums/form_mode.dart';
import 'package:panmasterapp/common/widgets/app_dialog.dart';
import 'package:panmasterapp/main_controller.dart';
import 'package:panmasterapp/model/password/password.dart';
import 'package:panmasterapp/screens/password_manager/password_manager_screen_controller.dart';

class PasswordManagerEditScreenController extends GetxController {
  final FormMode formMode;
  final MainController mainController = Get.find();
  final PasswordManagerScreenController passwordManagerScreenController = Get.find();

  Rx<String> pageTitle = "".obs;
  Rx<Password> selectedPassword = Password().obs;

  TextEditingController textEditingControllerLoginId = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerDescription = TextEditingController();

  FocusNode focusNodeLoginId = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeDescription = FocusNode();

  PasswordManagerEditScreenController({required this.formMode});

  @override
  void onInit() {
    super.onInit();
    selectedPassword.value = passwordManagerScreenController.selectedPassword!;
    switch (formMode) {
      case FormMode.newMode:
        pageTitle.value = "NEW PASSWORD";
        break;
      case FormMode.editMode:
        pageTitle.value = "EDIT PASSWORD";

        textEditingControllerLoginId.text = selectedPassword.value.loginId ?? "";
        textEditingControllerPassword.text = selectedPassword.value.password ?? "";
        textEditingControllerDescription.text = selectedPassword.value.passwordDescription ?? "";
        break;
    }
  }

  @override
  void dispose() {
    textEditingControllerLoginId.dispose();
    textEditingControllerPassword.dispose();
    textEditingControllerDescription.dispose();
    super.dispose();
  }

  void onLoginIdFieldSubmitted({required String value}) {
    selectedPassword.value.loginId = value;
    focusNodePassword.requestFocus();
  }

  void onPasswordFieldSubmitted({required String value}) {
    selectedPassword.value.password = value;
    Encrypted encrypted = mainController.encryptText(text: selectedPassword.value.password!);
    log("encrypted: ${encrypted.base64}");
    log("decrypted: ${mainController.decryptText(encrypted: encrypted,)}");
    focusNodeDescription.requestFocus();
  }

  void onDescriptionFieldSubmitted({required String value}) {
    selectedPassword.value.passwordDescription = value;
  }

  Future<void> onPasswordSaveButton({required BuildContext context}) async {
    // Validation Process
    String errorTxt = "";
    if (selectedPassword.value.loginId == null || selectedPassword.value.loginId!.isEmpty) {
      errorTxt += "Login ID cannot be empty.\n";
    }

    if (selectedPassword.value.password == null || selectedPassword.value.password!.isEmpty) {
      errorTxt += "Password cannot be empty.\n";
    }

    if (selectedPassword.value.passwordDescription == null || selectedPassword.value.passwordDescription!.isEmpty) {
      errorTxt += "Description cannot be empty.\n";
    }

    if (errorTxt.isNotEmpty) {
      await AppDialog.showAlertDialog(context: context, title: "Save Password Error", msg: errorTxt,);
    } else {
      // Create or Update Password to Database
      DateTime now = DateTime.now();
      switch (formMode) {
        case FormMode.newMode:
          AppDialog.showLoadingDialog(context: context);
          selectedPassword.value.passwordId = AppIdGenerator.newAppId();
          selectedPassword.value.createdAt = now;
          selectedPassword.value.updatedAt = now;

          bool insertSuccess = await AppSqliteDbManager().insertPassword(password: selectedPassword.value);
          if (insertSuccess) {
            Get.back();
          }

          Get.back();
          passwordManagerScreenController.textEditingControllerKeyword.text = "";
          await passwordManagerScreenController.getPasswordList();
          break;
        case FormMode.editMode:
          AppDialog.showLoadingDialog(context: context);
          selectedPassword.value.updatedAt = now;

          bool editSuccess = await AppSqliteDbManager().editPassword(password: selectedPassword.value);
          if (editSuccess) {
            Get.back();
          }

          Get.back();
          passwordManagerScreenController.textEditingControllerKeyword.text = "";
          await passwordManagerScreenController.getPasswordList();
          break;
      }
    }
  }

}
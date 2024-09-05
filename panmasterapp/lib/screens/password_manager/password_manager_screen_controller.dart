import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/common/app_sqlite_db_manager.dart';
import 'package:panmasterapp/common/app_toast.dart';
import 'package:panmasterapp/common/enums/doc_action_type.dart';
import 'package:panmasterapp/common/enums/form_mode.dart';
import 'package:panmasterapp/common/widgets/app_dialog.dart';
import 'package:panmasterapp/main_controller.dart';
import 'package:panmasterapp/model/password/password.dart';
import 'package:panmasterapp/screens/home/home_screen_controller.dart';
import 'package:panmasterapp/screens/password_manager/password_manager_edit_screen.dart';

class PasswordManagerScreenController extends GetxController {
  final MainController mainController = Get.find();
  final HomeScreenController homeScreenController = Get.find();
  RxList<Password> passwordList = <Password>[].obs;
  RxBool isLoading = false.obs;
  Password? selectedPassword;

  TextEditingController textEditingControllerKeyword = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await getPasswordList();
  }

  @override
  void dispose() {
    textEditingControllerKeyword.dispose();
    super.dispose();
  }

  Future<void> getPasswordList() async {
    try {
      isLoading.value = true;
      passwordList.value = await AppSqliteDbManager().getAllPasswords();
      isLoading.value = false;
    } catch (e) {
      log("GET PASSWORDS ERROR: ${e.toString()}");
      AppToast.showErrorToast(msg: "GET PASSWORDS ERROR: ${e.toString()}",);
      isLoading.value = false;
    }
  }

  Future<void> getPasswordListByKeyword() async {
    try {
      isLoading.value = true;
      passwordList.value = await AppSqliteDbManager().getPasswordsByDescription(description: "%${textEditingControllerKeyword.text}%",);
      isLoading.value = false;
    } catch (e) {
      log("GET PASSWORDS ERROR: ${e.toString()}");
      AppToast.showErrorToast(msg: "GET PASSWORDS ERROR: ${e.toString()}",);
      isLoading.value = false;
    }
  }

  void onNewPassword() {
    selectedPassword = Password();
    Get.to(() => const PasswordManagerEditScreen(formMode: FormMode.newMode,));
  }

  void onTapPasswordActionButton({required BuildContext context, required int index, required DocActionType type,}) async {
    switch (type) {
      case DocActionType.view:
        break;
      case DocActionType.edit:
        selectedPassword = passwordList[index];
        Get.to(() => const PasswordManagerEditScreen(formMode: FormMode.editMode,));
        break;
      case DocActionType.cancel:
        break;
      case DocActionType.delete:
        AppDialog.showLoadingDialog(context: context);
        bool deletePasswordSuccess = await AppSqliteDbManager().deletePassword(password: passwordList[index],);
        if (deletePasswordSuccess) {
          textEditingControllerKeyword.text == "" ? await getPasswordList() : await getPasswordListByKeyword();
        }
        await homeScreenController.loadPasswordList();
        Get.back();
        break;
      case DocActionType.print:
        break;
    }
  }

}
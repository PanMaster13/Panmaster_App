import 'dart:developer';

import 'package:get/get.dart';
import 'package:panmasterapp/common/app_toast.dart';
import 'package:panmasterapp/main_controller.dart';
import 'package:panmasterapp/model/password/password.dart';

class PasswordManagerScreenController extends GetxController {
  final MainController mainController = Get.find();
  RxList<Password> passwordList = <Password>[].obs;
  RxBool isLoading = false.obs;
  Password selectedPassword = Password();
  int selectedIndex = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getPasswordList() async {
    try {
      isLoading.value = true;

      isLoading.value = false;
    } catch (e) {
      log("GET PASSWORDS ERROR: ${e.toString()}");
      AppToast.showErrorToast(msg: "GET PASSWORDS ERROR: ${e.toString()}",);
      isLoading.value = false;
    }
  }
}
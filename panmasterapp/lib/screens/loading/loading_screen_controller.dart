import 'dart:developer';
import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:panmasterapp/common/app_sqlite_db_manager.dart';
import 'package:panmasterapp/common/app_toast.dart';
import 'package:panmasterapp/main_controller.dart';

class LoadingScreenController extends GetxController {
  final MainController mainController = Get.put(MainController());
  Rx<int> loadingNumber = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1), () async {
      loadingNumber.value = 25;
      loadingNumber.refresh();
      await getDeviceInfo();
      loadingNumber.value = 50;
      loadingNumber.refresh();
      await initLocalDB();
      loadingNumber.value = 100;
      loadingNumber.refresh();
      log("Application Version: ${mainController.appVersion}");
      log("Device ID: ${mainController.deviceId}");
      Get.offAndToNamed("/homeScreen");
    });
  }

  @override
  void dispose() {
    super.dispose();
    loadingNumber.value = 0;
  }

  Future<void> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    mainController.appVersion = packageInfo.version;

    if (Platform.isAndroid) {
      const androidIdPlugin = AndroidId();
      mainController.deviceId = await androidIdPlugin.getId() ?? "";
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      mainController.deviceId = iosDeviceInfo.identifierForVendor ?? "";
    }
  }

  Future<void> initLocalDB() async {
    log("[Loading] Init Local DB Start");
    try {
      bool creationSuccess = await AppSqliteDbManager().initializeDatabase();
      if (creationSuccess) {
        log("[Loading] Init Local DB Success!");
      } else {
        log("[Loading] Init Local DB Failure!");
      }
    } catch (e) {
      log("[Loading] Init Local DB Catch: ${e.toString()}");
      AppToast.showErrorToast(msg: "Failed to Start Local Database: ${e.toString()}");
    }
  }

}
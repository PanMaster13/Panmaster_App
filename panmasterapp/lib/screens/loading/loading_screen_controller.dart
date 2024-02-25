import 'dart:developer';
import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:panmasterapp/main_controller.dart';

class LoadingScreenController extends GetxController {
  final MainController mainController = Get.put(MainController());
  Rx<int> loadingNumber = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1), () async {
      loadingNumber.value = 50;
      loadingNumber.refresh();
      await getDeviceInfo();
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

}
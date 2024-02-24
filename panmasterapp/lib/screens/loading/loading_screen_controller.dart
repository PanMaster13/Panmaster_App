import 'package:get/get.dart';
import 'package:panmasterapp/main_controller.dart';

class LoadingScreenController extends GetxController {
  final MainController mainController = Get.put(MainController());
  Rx<int> loadingNumber = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      loadingNumber.value = 50;
      loadingNumber.refresh();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
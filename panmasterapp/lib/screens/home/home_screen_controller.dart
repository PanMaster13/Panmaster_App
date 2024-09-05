import 'package:get/get.dart';
import 'package:panmasterapp/common/app_sqlite_db_manager.dart';
import 'package:panmasterapp/main_controller.dart';
import 'package:panmasterapp/model/password/password.dart';

class HomeScreenController extends GetxController {
  final MainController mainController = Get.find();

  RxList<Password> passwordList = <Password>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await loadPasswordList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadPasswordList() async {
    passwordList.clear();
    passwordList.addAll(await AppSqliteDbManager().getAllPasswords(),);
  }

}
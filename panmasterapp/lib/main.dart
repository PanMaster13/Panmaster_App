import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/common/app_theme_data.dart';
import 'package:panmasterapp/main_controller.dart';
import 'package:panmasterapp/screens/home/home_screen.dart';
import 'package:panmasterapp/screens/loading/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown,]);
  Get.put(MainController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.themeData,
      home: const LoadingScreen(),
      getPages: <GetPage>[
        GetPage(name: "/homeScreen", page: () => const HomeScreen()),
      ],
    );
  }
}
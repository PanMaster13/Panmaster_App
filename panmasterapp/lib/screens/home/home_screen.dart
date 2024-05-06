import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/common/app_font_style.dart';
import 'package:panmasterapp/common/widgets/app_drawer.dart';
import 'package:panmasterapp/screens/home/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeScreenController homeScreenController = Get.put(HomeScreenController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text(
          "This is the home page",
          style: AppFontStyle.bodyNormal16,
        ),
      ),
    );
  }

}
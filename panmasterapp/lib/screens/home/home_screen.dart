import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/common/app_colors.dart';
import 'package:panmasterapp/common/app_font_style.dart';
import 'package:panmasterapp/common/widgets/app_drawer.dart';
import 'package:panmasterapp/screens/home/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeScreenController homeScreenController = Get.put(HomeScreenController());

    return Obx(() => Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10,),
        child: Column(
          children: [
            Container(
              width: Get.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("No. of Passwords Saved:", style: AppFontStyle.bodyNormal14,),

                  const SizedBox(height: 10,),

                  Center(
                    child: Text("${homeScreenController.passwordList.length.toString()} Password(s)", style: AppFontStyle.bodyBold18,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

}
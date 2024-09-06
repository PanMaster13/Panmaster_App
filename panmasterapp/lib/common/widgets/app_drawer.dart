import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/common/app_colors.dart';
import 'package:panmasterapp/common/app_font_style.dart';
import 'package:panmasterapp/main_controller.dart';
import 'package:panmasterapp/screens/home/home_screen.dart';
import 'package:panmasterapp/screens/password_manager/password_manager_screen.dart';
import 'package:panmasterapp/screens/season_checker/season_checker_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.find();

    return Theme(
      data: Theme.of(context),
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Row(
                children: [
                  Text("Welcome", style: AppFontStyle.bodyNormal18.copyWith(color: Colors.white,),),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.home,),
                    iconColor: Colors.black,
                    title: Text("Home", style: AppFontStyle.bodyNormal16.copyWith(color: Colors.black,),),
                    onTap: () => Get.off(() => const HomeScreen()),
                  ),

                  ListTile(
                    leading: const Icon(Icons.cloud,),
                    iconColor: Colors.black,
                    title: Text("Season Checker", style: AppFontStyle.bodyNormal16.copyWith(color: Colors.black,),),
                    onTap: () => Get.to(() => const SeasonCheckScreen()),
                  ),

                  ListTile(
                    leading: const Icon(Icons.lock),
                    iconColor: Colors.black,
                    title: Text("Password Manager", style: AppFontStyle.bodyNormal16.copyWith(color: Colors.black,),),
                    onTap: () => Get.to(() => const PasswordManagerScreen()),
                  ),
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                title: Text("Version ${mainController.appVersion}", style: AppFontStyle.bodyNormal16.copyWith(color: Colors.white,),),
                tileColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
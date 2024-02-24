import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/common/app_colors.dart';
import 'package:panmasterapp/common/app_font_style.dart';
import 'package:panmasterapp/screens/loading/loading_screen_controller.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoadingScreenController loadingScreenController = Get.put(LoadingScreenController());

    return Obx(() => SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 80.0, bottom: 20.0,),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const SizedBox(height: 10,),

              Center(
                child: Text(
                  loadingScreenController.loadingNumber.value.toString(),
                  style: AppFontStyle.header1.copyWith(color: AppColors.primaryColor,),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

}
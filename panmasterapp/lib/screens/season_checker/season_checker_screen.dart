import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/common/app_colors.dart';
import 'package:panmasterapp/common/app_font_style.dart';
import 'package:panmasterapp/common/widgets/app_text_field.dart';
import 'package:panmasterapp/screens/season_checker/season_checker_screen_controller.dart';

class SeasonCheckScreen extends StatelessWidget {
  const SeasonCheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SeasonCheckerScreenController seasonCheckerScreenController = Get.put(SeasonCheckerScreenController());

    return Obx(() => Scaffold(
      appBar: AppBar(
        title: const Text("Season Checker"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              readOnly: true,
              labelText: "Selected Date",
              textEditingController: seasonCheckerScreenController.textEditingControllerSelectedDateTime,
              onTap: () => seasonCheckerScreenController.onTapSelectedDateTime(context: context),
            ),

            const SizedBox(height: 10,),

            Container(
              width: Get.width,
              padding: const EdgeInsets.all(10.0,),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("The Current Season Is: ", style: AppFontStyle.bodyNormal14,),

                  const SizedBox(height: 10,),

                  Center(
                    child: Text(seasonCheckerScreenController.calculatedSeason.value, style: AppFontStyle.bodyBold18,),
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
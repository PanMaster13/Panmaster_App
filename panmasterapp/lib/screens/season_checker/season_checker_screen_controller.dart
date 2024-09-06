import 'dart:developer';

import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:panmasterapp/common/app_colors.dart';
import 'package:panmasterapp/common/app_constants.dart';
import 'package:panmasterapp/common/app_font_style.dart';
import 'package:panmasterapp/common/app_global_function.dart';
import 'package:panmasterapp/main_controller.dart';

class SeasonCheckerScreenController extends GetxController {
  final MainController mainController = Get.find();

  Rx<DateTime> selectedDateTime = DateTime.now().obs;
  Rx<String> calculatedSeason = "".obs;

  TextEditingController textEditingControllerSelectedDateTime = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    textEditingControllerSelectedDateTime.text = AppGlobalFunction.dateTimeInString(dateTime: selectedDateTime.value, format: DateFormat("dd/MM/yyyy"),);
    calculateSeasonBySelectedDateTime();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void calculateSeasonBySelectedDateTime() {
    if (selectedDateTime.value.month >= AppConstants.springMarchEquinoxMonth && selectedDateTime.value.month <= AppConstants.summerJuneSolsticeMonth) {
      log("1");
      if (selectedDateTime.value.day >= AppConstants.springMarchEquinoxDay) {
        // After or Equal March Equinox Day: Spring.
        calculatedSeason.value = "Spring";
        calculatedSeason.refresh();
      } else {
        // Before March Equinox Day: Winter.
        calculatedSeason.value = "Winter";
        calculatedSeason.refresh();
      }
    } else if (selectedDateTime.value.month >= AppConstants.summerJuneSolsticeMonth && selectedDateTime.value.month <= AppConstants.autumnSeptemberEquinoxMonth) {
      switch (selectedDateTime.value.month) {
        case AppConstants.summerJuneSolsticeMonth:
          if (selectedDateTime.value.day >= AppConstants.summerJuneSolsticeDay) {
            // After or Equal June Solstice Day: Summer.
            calculatedSeason.value = "Summer";
            calculatedSeason.refresh();
          } else {
            // Before June Solstice Day: Spring.
            calculatedSeason.value = "Spring";
            calculatedSeason.refresh();
          }
          break;
        case AppConstants.autumnSeptemberEquinoxMonth:
          if (selectedDateTime.value.day < AppConstants.autumnSeptemberEquinoxDay) {
            // Before September Equinox Day: Summer.
            calculatedSeason.value = "Summer";
            calculatedSeason.refresh();
          } else {
            // After or Equal September Equinox Day: Spring.
            calculatedSeason.value = "Autumn";
            calculatedSeason.refresh();
          }
          break;
        default:
          calculatedSeason.value = "Summer";
          calculatedSeason.refresh();
          break;
      }
    } else if (selectedDateTime.value.month >= AppConstants.autumnSeptemberEquinoxMonth && selectedDateTime.value.month <= AppConstants.winterDecemberSolsticeMonth) {
      log("3");
      if (selectedDateTime.value.day >= AppConstants.autumnSeptemberEquinoxDay) {
        // After or Equal September Equinox Day: Autumn.
        calculatedSeason.value = "Autumn";
        calculatedSeason.refresh();
      } else {
        // Before September Equinox Day: Summer.
        calculatedSeason.value = "Summer";
        calculatedSeason.refresh();
      }
    } else if (selectedDateTime.value.month >= AppConstants.winterDecemberSolsticeMonth && selectedDateTime.value.month <= AppConstants.springMarchEquinoxMonth) {
      log("4");
      if (selectedDateTime.value.day >= AppConstants.winterDecemberSolsticeDay) {
        // After or Equal December Solstice Day: Winter.
        calculatedSeason.value = "Winter";
        calculatedSeason.refresh();
      } else {
        // Before December Equinox Day: Autumn.
        calculatedSeason.value = "Autumn";
        calculatedSeason.refresh();
      }
    }
  }

  Future<void> onTapSelectedDateTime({required BuildContext context,}) async {
    DateTime now = DateTime.now();

    await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: now.subtract(const Duration(days: (365 * 5))),
      maxTime: now.add(const Duration(days: (365 * 5))),
      onConfirm: (DateTime date) {
        selectedDateTime.value = date;
        textEditingControllerSelectedDateTime.text = AppGlobalFunction.dateTimeInString(dateTime: selectedDateTime.value, format: DateFormat("dd/MM/yyyy"),);
        selectedDateTime.refresh();
        calculateSeasonBySelectedDateTime();
      },
      currentTime: selectedDateTime.value,
      theme: DatePickerTheme(
        backgroundColor: Colors.white,
        itemStyle: AppFontStyle.bodyBold16.copyWith(color: AppColors.primaryColor),
        cancelStyle: AppFontStyle.bodyNormal16.copyWith(color: Colors.grey),
        doneStyle: AppFontStyle.bodyNormal16.copyWith(color: AppColors.accentColor),
      ),
    );
  }

}
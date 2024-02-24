import 'package:flutter/material.dart';
import 'package:panmasterapp/common/app_colors.dart';
import 'package:panmasterapp/common/app_font_style.dart';

class AppThemeData {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.accentColor,),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(selectedItemColor: AppColors.primaryColor,),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.accentColor, selectionColor: AppColors.accentColor,),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor,),
      )
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: AppColors.primaryColor,
      titleTextStyle: AppFontStyle.bodyBold18.copyWith(color: Colors.white,),
    ),
    listTileTheme: ListTileThemeData(
      selectedColor: AppColors.primaryColor,
      selectedTileColor: Colors.grey.withOpacity(0.3),
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/common/app_colors.dart';
import 'package:panmasterapp/common/app_font_style.dart';

class AppDialog {
  static Future<void> showLoadingDialog({
    required BuildContext context,
    String? title,
  }) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext builderContext) {
        return SimpleDialog(
          backgroundColor: Colors.black,
          children: <Widget>[
            Center(
              child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CircularProgressIndicator(color: AppColors.accentColor,),

                    const SizedBox(height: 15,),

                    Text(title ?? "Loading...", style: AppFontStyle.bodyNormal14.copyWith(color: Colors.white,),),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Future<bool?> showAlertDialog({
    required BuildContext context,
    required String title,
    required String msg,
    String? positiveText,
    String? negativeText,
    void Function()? onTapPositiveButton,
    void Function()? onTapNegativeButton,
  }) async {
    return await showGeneralDialog(
      context: context,
      barrierLabel: "",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5,),
      transitionBuilder: (BuildContext builderContext, a1, a2, widget) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0,)).animate(a1),
          child: widget,
        );
      },
      pageBuilder: (BuildContext builderContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        return AppAlertDialog(
          title: title,
          msg: msg,
          positiveText: positiveText,
          negativeText: negativeText,
          onTapPositiveButton: onTapPositiveButton ?? () {
            Get.back(result: true,);
          },
          onTapNegativeButton: onTapNegativeButton ?? () {
            Get.back(result: false,);
          },
        );
      },
    );
  }
}

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    Key? key,
    required this.title,
    required this.msg,
    this.positiveText,
    this.negativeText,
    this.onTapPositiveButton,
    this.onTapNegativeButton,
  }) : super(key: key);

  final String title;
  final String msg;
  final String? positiveText;
  final String? negativeText;
  final void Function()? onTapPositiveButton;
  final void Function()? onTapNegativeButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
      title: Text(title, style: AppFontStyle.bodyBold18,),
      content: Text(msg, textAlign: TextAlign.start, style: AppFontStyle.bodyNormal14.copyWith(color: Colors.grey,),),
      contentPadding: const EdgeInsets.only(top: 15, left: 24, right: 24,),
      backgroundColor: Colors.white,
      actions: <Widget>[
        TextButton(onPressed: onTapNegativeButton, child: Text(negativeText?.toUpperCase() ?? "CANCEL", style: AppFontStyle.bodyBold14.copyWith(color: Colors.grey,),),),

        TextButton(onPressed: onTapPositiveButton, child: Text(positiveText?.toUpperCase() ?? "OK", style: AppFontStyle.bodyBold14.copyWith(color: AppColors.primaryColor,),),),
      ],
    );
  }
}
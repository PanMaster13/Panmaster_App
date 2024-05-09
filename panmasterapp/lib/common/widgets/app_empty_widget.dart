import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/common/app_colors.dart';
import 'package:panmasterapp/common/app_font_style.dart';

class AppEmptyWidget extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Function()? onRefresh;

  const AppEmptyWidget({Key? key, required this.text, this.icon, this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: Get.height * 0.25,),

          icon ?? const Icon(
            Icons.no_sim_outlined,
            size: 100,
            color: Colors.grey,
          ),

          const SizedBox(height: 10,),

          Text(text, style: AppFontStyle.header1.copyWith(color: Colors.grey,),),

          if (onRefresh != null)
            TextButton.icon(
              onPressed: onRefresh,
              icon: const Icon(Icons.refresh, color: AppColors.accentColor,),
              label: Text("Refresh", style: AppFontStyle.bodyBold14.copyWith(color: AppColors.accentColor,),),
            ),
        ],
      ),
    );
  }

}
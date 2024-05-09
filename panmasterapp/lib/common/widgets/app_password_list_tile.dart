import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:panmasterapp/common/app_colors.dart';
import 'package:panmasterapp/common/app_font_style.dart';
import 'package:panmasterapp/common/app_global_function.dart';
import 'package:panmasterapp/common/enums/doc_action_type.dart';
import 'package:panmasterapp/model/password/password.dart';

class AppPasswordListTile extends StatelessWidget {
  final Password password;
  final bool enabled;
  final bool isSelected;
  final Function(DocActionType) onTap;
  final bool canEdit;
  final bool canDelete;

  const AppPasswordListTile({
    Key? key,
    required this.password,
    required this.enabled,
    this.isSelected = false,
    required this.onTap,
    this.canEdit = true,
    this.canDelete = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: enabled,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.5,
        children: [
          if (canEdit)
            SlidableAction(
              onPressed: (context) { onTap(DocActionType.edit); },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: "Edit",
            ),
          if (canDelete)
            SlidableAction(
              onPressed: (context) { onTap(DocActionType.delete); },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: "Delete",
            ),
        ],
      ),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accentColor : null,
          border: Border.all(color: isSelected ? AppColors.primaryColor : Colors.grey, width: isSelected ? 1.5 : 0.5),
        ),
        padding: const EdgeInsets.all(10.0,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 5.0,),

                Expanded(
                  child: Text(password.passwordDescription ?? "", style: AppFontStyle.bodyBold14, overflow: TextOverflow.ellipsis,),
                ),

                Text(AppGlobalFunction.dateTimeInString(dateTime: password.createdAt ?? DateTime.now()), style: AppFontStyle.bodyNormal14,),

                const SizedBox(width: 5.0,),
              ],
            )
          ],
        ),
      ),
    );
  }

}
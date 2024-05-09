import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/common/app_colors.dart';
import 'package:panmasterapp/common/app_font_style.dart';
import 'package:panmasterapp/common/app_global_function.dart';
import 'package:panmasterapp/common/enums/form_mode.dart';
import 'package:panmasterapp/common/widgets/app_text_field.dart';
import 'package:panmasterapp/screens/password_manager/password_manager_edit_screen_controller.dart';

class PasswordManagerEditScreen extends StatelessWidget {
  final FormMode formMode;

  const PasswordManagerEditScreen({Key? key, required this.formMode,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PasswordManagerEditScreenController passwordManagerEditScreenController = Get.put(PasswordManagerEditScreenController(formMode: formMode));

    return Obx(() => Scaffold(
      appBar: AppBar(
        title: Text(passwordManagerEditScreenController.pageTitle.value,),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0,),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    textEditingController: passwordManagerEditScreenController.textEditingControllerLoginId,
                    focusNode: passwordManagerEditScreenController.focusNodeLoginId,
                    labelText: "Login ID",
                    prefixIcon: const Icon(Icons.person, color: AppColors.accentColor,),
                    onFieldSubmitted: (String value) => passwordManagerEditScreenController.onLoginIdFieldSubmitted(value: value,),
                    maxLength: 50,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5,),

            Row(
              children: [
                Expanded(
                  child: AppPasswordTextField(
                    textEditingController: passwordManagerEditScreenController.textEditingControllerPassword,
                    focusNode: passwordManagerEditScreenController.focusNodePassword,
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.password, color: AppColors.accentColor,),
                    onFieldSubmitted: (String value) => passwordManagerEditScreenController.onPasswordFieldSubmitted(value: value,),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5,),

            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    textEditingController: passwordManagerEditScreenController.textEditingControllerDescription,
                    focusNode: passwordManagerEditScreenController.focusNodeDescription,
                    labelText: "Description",
                    prefixIcon: const Icon(Icons.description, color: AppColors.accentColor,),
                    onFieldSubmitted: (String value) => passwordManagerEditScreenController.onDescriptionFieldSubmitted(value: value,),
                    maxLength: 100,
                  ),
                ),
              ],
            ),

            formMode == FormMode.editMode
                ? const SizedBox(height: 5,)
                : const SizedBox(),

            formMode == FormMode.editMode
                ? Row(
              children: [
                Column(
                  children: const [
                    Text("Created At: ", style: AppFontStyle.bodyNormal14,),

                    SizedBox(height: 5,),

                    Text("Updated At: ", style: AppFontStyle.bodyNormal14,),
                  ],
                ),

                Column(
                  children: [
                    Text(
                      AppGlobalFunction.dateTimeInString(dateTime: passwordManagerEditScreenController.selectedPassword.value.createdAt ?? DateTime.now(),),
                      style: AppFontStyle.bodyNormal14,
                    ),

                    const SizedBox(height: 5,),

                    Text(
                      AppGlobalFunction.dateTimeInString(dateTime: passwordManagerEditScreenController.selectedPassword.value.updatedAt ?? DateTime.now(),),
                      style: AppFontStyle.bodyNormal14,
                    ),
                  ],
                ),
              ],
            )
                : const SizedBox(),

            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 45,
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () => passwordManagerEditScreenController.onPasswordSaveButton(context: context),
                    child: Text("SAVE PASSWORD", textAlign: TextAlign.center, style: AppFontStyle.bodyNormal14.copyWith(color: Colors.white,),),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

}
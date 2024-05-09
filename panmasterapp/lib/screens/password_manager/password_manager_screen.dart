import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/common/app_colors.dart';
import 'package:panmasterapp/common/enums/doc_action_type.dart';
import 'package:panmasterapp/common/widgets/app_empty_widget.dart';
import 'package:panmasterapp/common/widgets/app_password_list_tile.dart';
import 'package:panmasterapp/screens/password_manager/password_manager_screen_controller.dart';

class PasswordManagerScreen extends StatelessWidget {
  const PasswordManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PasswordManagerScreenController passwordManagerScreenController = Get.put(PasswordManagerScreenController());

    return Obx(() => Scaffold(
      appBar: AppBar(
        title: const Text("Password Manager"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: passwordManagerScreenController.textEditingControllerKeyword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search By Description",
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search,),
                        onPressed: () => passwordManagerScreenController.getPasswordListByKeyword(),
                      ),
                    ),
                    onFieldSubmitted: (String keyword) => passwordManagerScreenController.getPasswordListByKeyword(),
                  ),
                ),
              ],
            ),
          ),

          passwordManagerScreenController.isLoading.value
              ? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
              : passwordManagerScreenController.passwordList.isEmpty
              ? AppEmptyWidget(
            text: "No Passwords Found",
            onRefresh: () {
              if (passwordManagerScreenController.textEditingControllerKeyword.text == "") {
                passwordManagerScreenController.getPasswordList();
              } else {
                passwordManagerScreenController.getPasswordListByKeyword();
              }
              },
          )
              : Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (builderContext, index) {
                return AppPasswordListTile(
                  password: passwordManagerScreenController.passwordList[index],
                  enabled: true,
                  onTap: (DocActionType type) {
                    passwordManagerScreenController.onTapPasswordActionButton(context: context, index: index, type: type);
                  },
                );
              },
              itemCount: passwordManagerScreenController.passwordList.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => passwordManagerScreenController.onNewPassword(),
        child: const Icon(Icons.add,),
      ),
    ));
  }

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panmasterapp/screens/password_manager/password_manager_screen_controller.dart';

class PasswordManagerScreen extends StatelessWidget {
  const PasswordManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PasswordManagerScreenController passwordManagerScreenController = Get.put(PasswordManagerScreenController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Password Manager"),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }

}
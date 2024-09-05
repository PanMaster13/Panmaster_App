import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  Encrypter cypher = Encrypter(AES(Key(Uint8List.fromList("PanKey1234567890".codeUnits))));
  IV iv = IV.fromLength(16);
  String deviceId = "";
  String appVersion = "";

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Encrypted encryptText({required String text}) {
    return cypher.encrypt(text, iv: iv,);
  }

  String decryptText({required Encrypted encrypted}) {
    return cypher.decrypt(encrypted, iv: iv,);
  }

  String decryptTextV2({required String encrypted}) {
    return cypher.decrypt64(encrypted, iv: iv,);
  }

}
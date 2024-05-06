import 'package:intl/intl.dart';
import 'dart:math';

class AppIdGenerator {
  static String newAppId() {
    DateTime dateTime = DateTime.now();
    DateFormat dateFormat = DateFormat("yyyyMMdd-HHmmss");
    String returnAppId = "${dateFormat.format(dateTime)}_${StringFormatting.generateRandomAlphaNumeric(4)}_${StringFormatting.generateRandomAlphaNumeric(4)}_${StringFormatting.generateRandomAlphaNumeric(6)}";
    return returnAppId;
  }
}

class StringFormatting {
  static final Random _random = Random();
  static const String _keywords = "abcdefghijklmnopqrstuvwxyz1234567890";

  static String generateRandomAlphaNumeric(int size) {
    String key = "";
    while (key.length < size) {
      key += _keywords[_random.nextInt(_keywords.length)];
    }
    return key;
  }
}
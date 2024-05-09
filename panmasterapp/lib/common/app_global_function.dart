import 'package:intl/intl.dart';

class AppGlobalFunction {

  /// Returns Date Time value in String.
  ///
  /// Converts Date Time into String following default [format] or provided [format].
  static String dateTimeInString({required DateTime dateTime, DateFormat? format,}) {
    format ??= DateFormat("dd/MM/yyyy HH:mm");
    return format.format(dateTime);
  }

}
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snack.dart';

class CommonUtils {


  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "0xFF" + hexColor;
    }
    return Color(int.parse(hexColor));
  }

  static void showToastMessage(String? title, {String? message}) {
    Get.snackbar(
      title ?? '',
      message ?? '',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

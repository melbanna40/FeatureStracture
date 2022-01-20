import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/log_utils.dart';

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
      duration: Duration(milliseconds: 1500),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      Log.d('Device id ${androidInfo.device}');
      return androidInfo.androidId;
    }
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      Log.d('Device id ${iosInfo.identifierForVendor}');
      return iosInfo.identifierForVendor;
    }
  }
}

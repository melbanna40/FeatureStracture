import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      duration: const Duration(milliseconds: 1500),
      snackPosition: SnackPosition.TOP,
    );
    // Get.closeCurrentSnackbar();
  }

  static bool isLoadingDialogVisible = false;

  static void showCustomDialog() {
    showGeneralDialog(
      context: Get.context!,
      barrierLabel: "Barrier",
      barrierDismissible: false,
      useRootNavigator: false,
      barrierColor: Colors.white.withOpacity(0.4),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        isLoadingDialogVisible = true;
        return const SizedBox();
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  static void closeCustomDialog() {
    if (isLoadingDialogVisible) {
      isLoadingDialogVisible = false;
      Navigator.pop(Get.context!);
    }
  }

// static Future<String?> getDeviceId() async {
//   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//   if (Platform.isAndroid) {
//     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//     Log.d('Device id ${androidInfo.device}');
//     return androidInfo.androidId;
//   }
//   if (Platform.isIOS) {
//     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//     Log.d('Device id ${iosInfo.identifierForVendor}');
//     return iosInfo.identifierForVendor;
//   }
//   return null;
// }
}

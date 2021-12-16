import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kafey/CommonUtils/log_utils.dart';

class HiveHelper {
  static ValueNotifier<Locale> mobileLanguage = ValueNotifier(Locale(
      '${Hive.box(HiveHelper.KEY_BOX_APP_LANGUAGE).get(HiveHelper.KEY_BOX_APP_LANGUAGE) != null}',
      'ar'));
  static const KEY_BOX_LOGIN_RESPONSE = "boxKeyLoginResponse";
  static const KEY_BOX_USER_RESPONSE = "boxKeyUserResponse";

  static var KEY_BOX_TOKEN = "boxKeyUserToken";

  static var boxKeyAppTheme = "boxKeyAppTheme";
  static var KEY_BOX_APP_LANGUAGE = "KEY_BOX_APP_LANGUAGE";

  static void setUserToken(String token) {
    Hive.box(HiveHelper.KEY_BOX_TOKEN)
        .put(HiveHelper.KEY_BOX_TOKEN, token)
        .whenComplete(() => Log.i(getUserToken()));
  }

  static String getUserToken() {
    return Hive.box(HiveHelper.KEY_BOX_TOKEN).isNotEmpty
        ? Hive.box(HiveHelper.KEY_BOX_TOKEN).get(HiveHelper.KEY_BOX_TOKEN)
        : '';
  }

  static String getAppLanguage() {
    return Hive.box(HiveHelper.KEY_BOX_APP_LANGUAGE).isNotEmpty
        ? Hive.box(HiveHelper.KEY_BOX_APP_LANGUAGE)
            .get(HiveHelper.KEY_BOX_APP_LANGUAGE)
        : 'ar';
  }
}

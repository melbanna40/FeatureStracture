import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:byaan/CommonUtils/log_utils.dart';
import 'package:byaan/network/api/network_api.dart';

class HiveHelper {
  static ValueNotifier<Locale> mobileLanguage = ValueNotifier(Locale(
      '${Hive.box(HiveHelper.keyBoxAppLanguage).get(HiveHelper.keyBoxAppLanguage) != null}',
      'ar'));
  static const boxKeyLoginResponse = "boxKeyLoginResponse";

  static var boxKeyUserToken = "boxKeyUserToken";

  static var boxKeyAppTheme = "boxKeyAppTheme";
  static var keyBoxAppLanguage = "keyBoxAppLanguage";
  static var keyAppBaseUrl = "keyAppBaseUrl";

  static void setBaseUrl(String baseUrl) {
    Hive.box(HiveHelper.keyAppBaseUrl)
        .put(HiveHelper.keyAppBaseUrl, baseUrl)
        .whenComplete(() => Log.i(baseUrl));
  }

  static String getBaseUrl() {
    return Hive.box(HiveHelper.keyAppBaseUrl).isNotEmpty
        ? Hive.box(HiveHelper.keyAppBaseUrl).get(HiveHelper.keyAppBaseUrl)
        : Api.baseUrl;
  }

  static void setUserToken(String token) {
    Hive.box(HiveHelper.boxKeyUserToken)
        .put(HiveHelper.boxKeyUserToken, token)
        .whenComplete(() => Log.i(getUserToken()));
  }

  static String getUserToken() {
    return Hive.box(HiveHelper.boxKeyUserToken).isNotEmpty
        ? Hive.box(HiveHelper.boxKeyUserToken).get(HiveHelper.boxKeyUserToken)
        : '';
  }

  static String getAppLanguage() {
    return Hive.box(HiveHelper.keyBoxAppLanguage).isNotEmpty
        ? Hive.box(HiveHelper.keyBoxAppLanguage)
            .get(HiveHelper.keyBoxAppLanguage)
        : 'ar';
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kafey/CommonUtils/log_utils.dart';
import 'package:kafey/network/api/ApiResponse/login_response.dart';

class HiveHelper {
  static ValueNotifier<Locale> mobileLanguage = ValueNotifier(Locale(
      '${Hive.box(HiveHelper.KEY_BOX_APP_LANGUAGE).get(HiveHelper.KEY_BOX_APP_LANGUAGE) != null}',
      'ar'));
  static const KEY_BOX_LOGIN_RESPONSE = "boxKeyLoginResponse";
  static const KEY_BOX_USER_RESPONSE = "boxKeyUserResponse";

  static var KEY_BOX_TOKEN = "boxKeyUserToken";

  static var boxKeyAppTheme = "boxKeyAppTheme";
  static var KEY_BOX_APP_LANGUAGE = "KEY_BOX_APP_LANGUAGE";
  static var KEY_APP_BASE_URL = "KEY_APP_BASE_URL";

  static void setBaseUrl(String baseUrl) {
    Hive.box(HiveHelper.KEY_APP_BASE_URL)
        .put(HiveHelper.KEY_APP_BASE_URL, baseUrl)
        .whenComplete(() => Log.i(baseUrl));
  }

  static String getBaseUrl() {
    return Hive.box(HiveHelper.KEY_APP_BASE_URL).isNotEmpty
        ? Hive.box(HiveHelper.KEY_APP_BASE_URL).get(HiveHelper.KEY_APP_BASE_URL)
        : '';
  }

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

  static void setUserData(Map<String, dynamic> data) {
    Hive.box(HiveHelper.KEY_BOX_USER_RESPONSE).put(
        HiveHelper.KEY_BOX_USER_RESPONSE, new Map<String, dynamic>.from(data));
  }

  static UserDataModel? getUserData =
      Hive.box(HiveHelper.KEY_BOX_USER_RESPONSE).isNotEmpty
          ? UserDataModel.fromJson(
              new Map<String, dynamic>.from(
                Hive.box(HiveHelper.KEY_BOX_USER_RESPONSE)
                    .get(HiveHelper.KEY_BOX_USER_RESPONSE),
              ),
            )
          : null;

  static String getAppLanguage() {
    return Hive.box(HiveHelper.KEY_BOX_APP_LANGUAGE).isNotEmpty
        ? Hive.box(HiveHelper.KEY_BOX_APP_LANGUAGE)
            .get(HiveHelper.KEY_BOX_APP_LANGUAGE)
        : 'ar';
  }
}

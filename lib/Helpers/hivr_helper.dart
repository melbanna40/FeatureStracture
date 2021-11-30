import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static ValueNotifier<Locale> mobileLanguage =  ValueNotifier(Locale(
      '${Hive.box(HiveHelper.KEY_BOX_APP_LANGUAGE).get(HiveHelper.KEY_BOX_APP_LANGUAGE) != null}',
      'ar')
  );
  static const KEY_BOX_LOGIN_RESPONSE = "boxKeyLoginResponse";
  static const KEY_BOX_USER_RESPONSE = "boxKeyUserResponse";

  static var KEY_BOX_TOKEN = "boxKeyUserToken";

  static var boxKeyAppTheme = "boxKeyAppTheme";
  static var KEY_BOX_APP_LANGUAGE = "KEY_BOX_APP_LANGUAGE";

  // static VerifyCodeModel? userResponse = VerifyCodeModel.fromJson(
  //     Hive.box(HiveHelper.KEY_BOX_LOGIN_RESPONSE).get(HiveHelper.KEY_BOX_LOGIN_RESPONSE));
}

/// This class for creating any static constant you want to use all over the app

class AppConstant {
  static const String appName = "LMS";
  static const String mainDir = "/";
  static const String favorite = "favorite";
  static const String data = "data";
  static const String message = "message";
  static const String code = "code";

  static const bool inProduction = bool.fromEnvironment("dart.vm.product");

  static const String appLogoPath = "assets/images/ic_arabic_cafe_logo.png";

  static const String mapApi = "AIzaSyB8gvoP_4UBFjZOzicPbGTlg4JCco4MyjI";
  static const String tapApiKeyLive = "sk_test_XKokBfNWv6FIYuTMg5sLPjhJ";

  // static const String tapApiKeyLive = "sk_live_hmeV3DftBxIdnPTi5ar8S9zw";
  // ignore: constant_identifier_names
  static const String ONESIGNAL_APP_ID = 'start';
  static const String privacy =
      'https://pages.flycricket.io/zaheyapp/privacy.html';

  // ignore: non_constant_identifier_names
  static var SOURCE_LOGIN = "LOGIN";
}

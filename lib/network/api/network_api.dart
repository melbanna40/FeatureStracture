import 'package:byaan/Helpers/hive_helper.dart';

class Api {
  //base Url

  static String baseUrl = HiveHelper.getBaseUrl();

  static const String tempBaseUrl = "http://0.0.0.0:3000//";

  static const String getTempDataApiCall = "users";
}

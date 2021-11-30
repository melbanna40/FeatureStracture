class BaseResponseConstants {
  static const bool inProduction = bool.fromEnvironment("dart.vm.product");

  static const String data = "data";
  static const String message = "message";
  static const String code = "code";
}

import 'package:flutter/cupertino.dart';

class Setting {
  String? appName = "Zahey";
  double? defaultTax;
  String? defaultCurrency;
  bool? currencyRight = false;
  bool? payPalEnabled = true;
  bool? stripeEnabled = true;
  String? mainColor;
  String? mainDarkColor;
  String? secondColor;
  String? secondDarkColor;
  String? accentColor;
  String? accentDarkColor;
  String? scaffoldDarkColor;
  String? scaffoldColor;
  String? googleMapsKey;
  static ValueNotifier<Locale> mobileLanguage =
      ValueNotifier(const Locale('en', ''));
  String? appVersion;
  bool enableVersion = true;
}

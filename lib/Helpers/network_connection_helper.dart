import 'package:byaan/CommonUtils/common_utils.dart';
import 'package:byaan/CommonUtils/log_utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class NetworkConnectionManger {
  static Connectivity mConnectivity = Connectivity();
  static late ConnectivityResult mConnectivityResult;

  static Future<ConnectivityResult> initNetworkConnectivity() async {
    try {
      mConnectivityResult = await mConnectivity.checkConnectivity();
    } on PlatformException catch (e) {
      Log.e(e.toString());
    }
    return mConnectivityResult;
  }

  static bool isInternetConnected({String? message}) {
    if (mConnectivityResult == ConnectivityResult.mobile ||
        mConnectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (mConnectivityResult == ConnectivityResult.none) {
      if (message != null) {
        CommonUtils.showToastMessage(message);
      }
      return false;
    } else {
      return false;
    }
  }
}

import 'dart:io';

import 'package:dio/dio.dart';

import 'error_status.dart';

class ExceptionHandle {
  static String globalError = "Some Thing Wrong Happened...";

  static NetError handleException(dynamic error) {
    if (error is DioError) {
      if (error.type == DioErrorType.other ||
          error.type == DioErrorType.response) {
        dynamic e = error.error;

        ///网络异常
        if (e is SocketException) {
          return NetError(ErrorStatus.SOCKET_ERROR, globalError);
        }

        ///服务器异常`
        if (e is HttpException) {
          return NetError(ErrorStatus.SERVER_ERROR, globalError);
        }
        //默认返回网络异常
        return NetError(ErrorStatus.NETWORK_ERROR, globalError);

        ///各种超时
      } else if (error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.sendTimeout ||
          error.type == DioErrorType.receiveTimeout) {
        return NetError(ErrorStatus.TIMEOUT_ERROR, globalError);

        ///取消请求操作
      } else if (error.type == DioErrorType.cancel) {
        return NetError(ErrorStatus.CANCEL_ERROR, "");

        //其他异常
      } else {
        return NetError(ErrorStatus.UNKNOWN_ERROR, globalError);
      }
    } else {
      return NetError(ErrorStatus.UNKNOWN_ERROR, globalError);
    }
  }
}

class NetError {
  int code;
  String msg;

  NetError(this.code, this.msg);
}

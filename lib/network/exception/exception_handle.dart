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

        if (e is SocketException) {
          return NetError(ErrorStatus.socketError, globalError);
        }

        if (e is HttpException) {
          return NetError(ErrorStatus.serverError, globalError);
        }
        return NetError(ErrorStatus.networkError, globalError);
      } else if (error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.sendTimeout ||
          error.type == DioErrorType.receiveTimeout) {
        return NetError(ErrorStatus.timeoutError, globalError);
      } else if (error.type == DioErrorType.cancel) {
        return NetError(ErrorStatus.cancelError, "");
      } else {
        return NetError(ErrorStatus.unknownError, globalError);
      }
    } else {
      return NetError(ErrorStatus.unknownError, globalError);
    }
  }
}

class NetError {
  int code;
  String msg;

  NetError(this.code, this.msg);
}

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:cubit_template/network/exception/error_status.dart';
import 'package:cubit_template/network/network_util.dart';
@lazySingleton
class BasePresenter {

  Future requestFutureData<T>(Method method,
      {String? url,
      String? newBaseUrl,
      bool isShow = true,
      bool isClose = true,
      Function(T t)? onSuccess,
      Function(List<T> list)? onSuccessList,
      Function(int code, String msg)? onError,
      dynamic params,
      Map<String, dynamic>? queryParams,
      CancelToken? cancelToken,
      Options? options,
        void Function(int,int)?  onSendProgress,

        bool isList = false}) async {
    await DioUtils.instance.requestDataFuture<T>(method, url!, newBaseUrl ?? "",
        onSendProgress: onSendProgress,
        params: params,
        queryParameters: queryParams,
        options: options,
        cancelToken: cancelToken, onSuccess: (data) {
      if (onSuccess != null) {
        onSuccess(data);
      }
    }, onSuccessList: (data) {
      if (isClose && onSuccessList != null) {
        onSuccessList(data);
      }
    }, onError: (code, msg) {
      if (isClose) {
        _onError(code, msg, onError!);
      }
    });
  }

  void requestDataFromNetwork<T>(Method method,
      {String? url,
      bool isShow = true,
      bool isClose = true,
      Function(T t)? onSuccess,
      Function(List<T> list)? onSuccessList,
      Function(int code, String msg)? onError,
      dynamic params,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      bool isList = false}) {
    DioUtils.instance.requestData<T>(method, url!,
        params: params,
        queryParameters: queryParameters!,
        cancelToken: cancelToken!,
        options: options!,
        isList: isList, onSuccess: (data) {
      if (onSuccess != null) {
        onSuccess(data);
      }
    }, onSuccessList: (data) {
      if (isClose && onSuccessList != null) {
        onSuccessList(data);
      }
    }, onError: (code, msg) {
      if (isClose) {
        _onError(code, msg, onError!);
      }
    });
  }

  _onError(int code, String msg, Function(int code, String msg) onError) {
    if (code != ErrorStatus.cancelError) {}

    onError(code, msg);
  }
}

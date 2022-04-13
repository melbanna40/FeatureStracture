import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'exception/error_status.dart';
import 'newtork_utails.dart';

abstract class NetworkRequest {
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
      bool isList = false});
}

@Injectable(as: NetworkRequest)
class NetworkRequestImp implements NetworkRequest {
  @override
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
      bool isList = false}) async {
    await DioUtils.instance.requestDataFuture<T>(method, url!, newBaseUrl ?? "",
        params: params,
        queryParameters: queryParams,
        options: options,
        cancelToken: cancelToken, onSuccess: (data) {
      //view.closeProgress();
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
    //view.closeProgress();
    if (code != ErrorStatus.CANCEL_ERROR) {
      // view!.showToasts(msg);
    }
    onError(code, msg);
  }
}

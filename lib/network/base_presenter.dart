import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:byaan/network/network_util.dart';

import 'exception/error_status.dart';

abstract class BaseApiHelper {
  Future requestFutureData<T>(Method method,
      {String? url,
      String? newBaseUrl,
      bool isFormData,
      FormData formData,
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

@Injectable(as: BaseApiHelper)
class NetworkRequestImp implements BaseApiHelper {
  @override
  Future requestFutureData<T>(Method method,
      {String? url,
      String? newBaseUrl,
      bool isShow = true,
      bool isClose = true,
      bool isFormData = false,
      FormData? formData,
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
        isFormData: isFormData,
        dataForm: formData,
        queryParameters: queryParams,
        options: options,
        cancelToken: cancelToken, onSuccess: (data) {
      //view.closeProgress();
      if (onSuccess != null) {
        onSuccess(data);
      }
    }, onSuccessList: (data) {
      if (onSuccessList != null) {
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
    if (code != ErrorStatus.cancelError) {
      // view!.showToasts(msg);
    }
    onError(code, msg);
  }
}

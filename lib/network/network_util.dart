import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:cubit_template/CommonUtils/log_utils.dart';

import 'api/network_api.dart';
import 'exception/error_status.dart';
import 'exception/exception_handle.dart';
import 'interceptors.dart';
import 'net_response.dart';

Map<String, dynamic> headers = {
  "Accept": "application/json",
  "Content-Type": "application/json",
};

class DioUtils {
  static final DioUtils _singleInstance = DioUtils._internal();

  static DioUtils get instance => DioUtils();

  factory DioUtils() {
    return _singleInstance;
  }

  static Dio? _dio;
  BaseOptions? _options;

  Dio getDio() {
    return _dio!;
  }

  DioUtils._internal() {
    _options = BaseOptions(

      baseUrl: Api.baseUrl,
      connectTimeout: 15000,
      receiveTimeout: 5000,
      responseType: ResponseType.plain,
      headers: headers,
      validateStatus: (status) {
        return true;
      },
    );

    _dio = Dio(_options);

    _dio!.interceptors.add(AuthInterceptor());

    _dio!.interceptors.add(LoggingInterceptor());

    _dio!.interceptors.add(AdapterInterceptor());
  }

  Future<BaseResponse<T>> _request<T>(String method, String url,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,void Function(int,int)?  onSendProgress}) async {
    var response = await _dio!.request(url,
onSendProgress: onSendProgress,

        data: data,
        queryParameters: queryParameters,
        options: _setOptions(method, options!),
        cancelToken: cancelToken);
    try {
      Map<String, dynamic> _map =
          await compute(parseData, response.data.toString());
      return BaseResponse.fromJson(_map);
    } catch (e) {
      Log.e(e.toString());
      return BaseResponse(ErrorStatus.parseError, "PARSE_ERROR", null);
    }
  }

  Future requestDataFuture<T>(Method method, String url, String newBaseUrl,
      {Function(T t)? onSuccess,
      Function(List<T> list)? onSuccessList,
      Function(int code, String msg)? onError,
      dynamic params,

      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
        void Function(int,int)?  onSendProgress,
      bool isList = false}) async {
    if (newBaseUrl.isNotEmpty) {
      _options!.baseUrl = newBaseUrl;
    } else {
      _options!.baseUrl = Api.baseUrl;
    }
    String requestMethod = _getMethod(method);
    return await _request<T>(requestMethod, url,onSendProgress: onSendProgress,
            data: params,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken)
        .then((BaseResponse<T> result) {
      if (result.code == ErrorStatus.requestDataOk) {
        if (isList) {
          if (onSuccessList != null) {
            onSuccessList(result.listData!);
          }
        } else {
          if (onSuccess != null) {
            onSuccess(result.data!);
          }
        }
      } else {
        Log.e(result.toString());
        _onError(result.code!, result.message!, onError!);
      }
    }, onError: (e) {
      Log.e(e.toString());
      _cancelLog(e, url);
      NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError!);
    });
  }

  BaseResponse parseError() {
    return BaseResponse(ErrorStatus.parseError, "Data parsing error", null);
  }

  Options _setOptions(String method, Options options) {
    options.method = method;
    return options;
  }

  //Request the operation of a single object
  Future<BaseResponse<T?>> request<T>(String method, String url,
      {Map<String, dynamic>? params,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options}) async {
    var response = await _request<T>(method, url,
        data: params,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
    return response;
  }

  requestData<T>(Method method, String url,
      {Function(T t)? onSuccess,
      Function(List<T> t)? onSuccessList,
      Function(int code, String msg)? onError,
      Map<String, dynamic>? params,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      Options? options,
      bool isList = false}) {
    String requestMethod = _getMethod(method);
    Stream.fromFuture(_request<T>(requestMethod, url,
            data: params,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken))
        .asBroadcastStream()
        .listen((result) {
      //Successful data returned
      if (result.code == ErrorStatus.requestDataOk) {
        if (isList) {
          if (onSuccessList != null) {
            onSuccessList(result.listData!);
          }
        } else {
          if (onSuccess != null) {
            onSuccess(result.data!);
          }
        }
      } else {
        _onError(result.code!, result.message!, onError!);
      }
    }, onError: (e) {
      _cancelLog(e, url);
      NetError error = ExceptionHandle.handleException(e);
      _onError(error.code, error.msg, onError!);
    });
  }

  _cancelLog(dynamic e, String url) {
    if (e is DioError && CancelToken.isCancel(e)) {
      Log.i("Cancel network request：$url");
    }
  }

  _onError(int code, String msg, Function(int code, String msg) onError) {
    Log.e("Interface request exception code:$code message:$msg");
    onError(code, msg);
  }

  //Request type
  String _getMethod(Method method) {
    String netMethod;
    switch (method) {
      case Method.get:
        netMethod = "GET";
        break;
      case Method.post:
        netMethod = "POST";
        break;
      case Method.put:
        netMethod = "PUT";
        break;
      case Method.delete:
        netMethod = "DELETE";
        break;
    }
    return netMethod;
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data);
}

enum Method {
  get,
  post,
  put,
  delete,
}

import 'package:dio/dio.dart';
import 'package:sprintf/sprintf.dart';

import '../CommonUtils/log_utils.dart';
import 'exception/error_status.dart';

///Header management interceptor
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept"] = "application/json";
    super.onRequest(options, handler);
  }
}

///Log interceptor settings
class LoggingInterceptor extends Interceptor {
  DateTime? startTime;
  DateTime? endTime;

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    startTime = DateTime.now();
    Log.d("----------Request Start---------");
    Log.i(" path :" + options.path);

    // if(options.path.contains(Api.getCountriesListApiCall)){
    //   options.baseUrl=Api.nartaqiBaseUrl;
    // }

    ///print full path request
    if (options.queryParameters.isEmpty) {
      if (options.path.contains(options.baseUrl)) {
        Log.i("RequestUrl:" + options.path);
      } else {
        Log.i("RequestUrl:" + options.baseUrl + options.path);
      }
    } else {
      ///If queryParameters is not empty, splice into a complete URl
      Log.i("RequestUrl:" +
          options.baseUrl +
          options.path +
          "?" +
          Transformer.urlEncodeMap(options.queryParameters));
    }

    Log.w("RequestMethod:" + options.method);
    Log.w("RequestHeaders:" + options.headers.toString());
    Log.w("RequestContentType:" + options.contentType.toString());
    Log.w("RequestDataOptions:${options.data.toString()}");

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    endTime = DateTime.now();
    //Request duration
    int duration = endTime!.difference(startTime!).inMilliseconds;
    Log.i("----------End Request $duration millisecond---------");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Log.e("--------------Error-----------");
    Log.e(err.message);
    super.onError(err, handler);
  }
}

//parsing data
class AdapterInterceptor extends Interceptor {
  // ignore: constant_identifier_names
  static const String MSG = "msg";
  // ignore: constant_identifier_names
  static const String SLASH = "\"";
  // ignore: constant_identifier_names
  static const String MESSAGE = "message";
  // ignore: constant_identifier_names
  static const String ERROR = "validateError";

  // ignore: constant_identifier_names
  static const String DEFAULT = "\"NOT_FOUND\"";
  // ignore: constant_identifier_names
  static const String NOT_FOUND = "Some Thing Wrong Happened";

  // ignore: constant_identifier_names
  static const String FAILURE_FORMAT = "{\"code\":%d,\"message\":\"%s\"}";
  // ignore: constant_identifier_names
  static const String SUCCESS_FORMAT =
      "{\"code\":0,\"data\":%s,\"message\":\"\"}";

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    Response mResponse = adapterData(response);
    return super.onResponse(mResponse, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      adapterData(err.response!);
    }
    return super.onError(err, handler);
  }

  Response adapterData(Response response) {
    String result;
    String content = response.data == null ? "" : response.data.toString();
    if (response.statusCode == ErrorStatus.SUCCESS) {
      if (content.isEmpty) {
        content = DEFAULT;
      }
      result = sprintf(SUCCESS_FORMAT, [content]);
      response.statusCode = ErrorStatus.SUCCESS;
    } else {
      result = sprintf(FAILURE_FORMAT, [response.statusCode, NOT_FOUND]);
      response.statusCode = ErrorStatus.SUCCESS;
    }
    if (response.statusCode == ErrorStatus.SUCCESS) {
      Log.d("ResponseCode:${response.statusCode}");
      Log.d("response:${response.data}");
    } else {
      Log.e("ResponseCode:${response.statusCode}");
      Log.d("response:${response.data}");
    }
    Log.json(result);
    response.data = result;
    return response;
  }
}

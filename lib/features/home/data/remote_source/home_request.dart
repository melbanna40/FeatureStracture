import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import '../../../../../../network/api/network_api.dart';
import '../../../../../../network/network_request.dart';
import '../../../../../../network/newtork_utails.dart';
import '../../../../CommonUtils/log_utils.dart';
import '../../../../dependencies/dependency_init.dart';
import '../model/home_model/home_model.dart';

typedef OrderRemoteResponse = Either<String, Home>;

abstract class HomeRequest {
  Future<OrderRemoteResponse> getStoreList(int take);
}

@Injectable(as: HomeRequest)
class StoreRequestImp implements HomeRequest {
  @override
  Future<OrderRemoteResponse> getStoreList(int take) async {
    var body = {
      "take": take,
    };
    OrderRemoteResponse tableRemoteResponse = left("");
    Log.e("Inside Table Request");
    await getIt<NetworkRequest>().requestFutureData<HomeModel>(
      Method.get,
      params: body,
      options: Options(
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer 111'
        },
      ),
      url: "${Api.doHomeApiCall}?take=$take",
      onSuccess: (data) {
        Log.e("Print Table --${data}");
        tableRemoteResponse = right(data.data!);
      },
      onError: (code, msg) {
        Log.e("Print Table ErrorCode $code  ErrorMessage $msg");
        tableRemoteResponse = left(msg);
      },
    );
    return tableRemoteResponse;
  }
}

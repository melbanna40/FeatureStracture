import 'dart:convert';
import 'dart:io';

import 'package:byaan/features/auth/login/data/model/user_model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import '../../../../../CommonUtils/log_utils.dart';
import '../../../../../dependencies/dependency_init.dart';
import '../../../../../network/api/network_api.dart';
import '../../../../../network/network_request.dart';
import '../../../../../network/newtork_utails.dart';
 
typedef LoginResponse = Either<String, User>;

abstract class LoginRequest {
  Future<LoginResponse> getUserData(String phone, String password);
}

@Injectable(as: LoginRequest)
class LoginRequestImp extends LoginRequest {
  @override
  Future<LoginResponse> getUserData(String phone, String password) async {
    LoginResponse loginResponse = left("");
    var body = {
      "phone": phone.trim(),
      "password": password.trim(),
    };
    Log.e("Inside Login Request");
    await getIt<NetworkRequest>().requestFutureData<UserModel>(
      Method.post,
      params: body,
      options: Options(
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
        },
      ),
      url: Api.doServerLoginApiCall,
      onSuccess: (data) {
        Log.e("Print Login --$data");
        loginResponse = right(data.data!);
      },
      onError: (code, msg) {
        Log.e("Print Login Error $msg");
        loginResponse = left(msg);
      },
    );
    return loginResponse;
  }
}

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/CommonUtils/log_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/UI/Main/main_screen.dart';
import 'package:kafey/UI/User/change_password/change_password_screen.dart';
import 'package:kafey/UI/User/login/login_screen.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/dependencies/dependency_init.dart';
import 'package:kafey/network/api/ApiResponse/login_response.dart';
import 'package:kafey/network/api/ApiResponse/save_device_token_response.dart';
import 'package:kafey/network/api/network_api.dart';
import 'package:kafey/network/network_util.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String? countryCode;
  bool passwordVisibility = true;

  void updatePasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    emit(LoginSuccessState());
  }

  final BasePresenter _presenter = getIt<BasePresenter>();

  Future doServerLogin(
      String phone, String password, String company_sub_domain) async {
    emit(LoginLoadingState());
    CommonUtils.showToastMessage('جآر التحميل');
    await _presenter.requestFutureData<LoginResponse>(Method.post,
        url: Api.doNewLoginApiCall,
        options: Options(method: Method.post.toString()),
        newBaseUrl: Api.firstBaseUrl,
        params: {
          "phone": phone.trim(),
          "password": password.trim(),
          "company_sub_domain": company_sub_domain.trim(),
          // "mac_address": await CommonUtils.getDeviceId(),
        }, onSuccess: (data) {
      if (data.code == 200) {
        HiveHelper.setBaseUrl('http://${data.data!.user!.companyDomain!}/api/');
        Api.baseUrl = 'http://${data.data!.user!.companyDomain!}/api/';

        Log.i(HiveHelper.getBaseUrl());
        if (data.data!.user!.loggedBefore! == 1 &&
            data.data!.nextStep == 'redirect_to_home') {
          doSaveDeviceToken(data.data!.accessToken!);
          emit(LoginSuccessState());
          HiveHelper.setUserToken(data.data!.accessToken!);
          // HiveHelper.setUserData(data.data!.toJson());

          Hive.box(HiveHelper.KEY_BOX_USER_RESPONSE).put(
              HiveHelper.KEY_BOX_USER_RESPONSE,
              new Map<String, dynamic>.from(data.data!.toJson()));

          Get.offAll(() => MainScreen());
        } else if (data.data!.user!.loggedBefore! == 0 &&
            data.data!.nextStep == 'redirect_to_change_password') {
          Get.to(() => ChangePasswordScreen(data.data!.user!.id.toString(),
              data.data!.user!.tenantId.toString()));
        }
      } else {
        emit(LoginErrorState());
        CommonUtils.showToastMessage(data.message);
      }
    }, onError: (code, msg) {
      emit(LoginErrorState());
      CommonUtils.showToastMessage(msg);
    });
  }

  Future doSaveDeviceToken(String token) async {
    headers[HttpHeaders.authorizationHeader] = "Bearer " + token;
    emit(LoginLoadingState());
    await _presenter.requestFutureData<SaveDeviceTokenResponse>(Method.post,
        url: Api.postNotificationsDeviceTokenApiCall,
        options: Options(method: Method.post.toString(), headers: headers),
        params: {
          "device_token": await FirebaseMessaging.instance.getToken(),
        }, onSuccess: (data) {
      if (data.code == 200) {
        emit(LoginSuccessState());
      } else if (data.code == 401) {
        Hive.box(HiveHelper.KEY_BOX_TOKEN).clear();
        Get.offAll(LoginScreen());
      } else if (data.code == 400) {
        CommonUtils.showToastMessage(data.message);
        emit(LoginErrorState());
      }
    }, onError: (code, msg) {
      emit(LoginErrorState());
      CommonUtils.showToastMessage(msg);
    });
  }
}

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
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

  Future doServerLogin(String email, String password, String deviceId) async {
    emit(LoginLoadingState());
    await _presenter.requestFutureData<LoginResponse>(Method.post,
        url: Api.doLoginApiCall,
        options: Options(method: Method.post.toString()),
        params: {
          "email": email,
          "password": password,
          "mac_address": await CommonUtils.getDeviceId(),
        }, onSuccess: (data) {
      if (data.code == 200) {
        if (data.data!.original!.loggedBefore == 1) {
          doSaveDeviceToken(data.data!.original!.accessToken!);
          emit(LoginSuccessState());
          HiveHelper.setUserToken(data.data!.original!.accessToken!);
          Get.offAll(() => MainScreen());
        } else if (data.data!.original!.loggedBefore == 0) {
          Get.to(() => ChangePasswordScreen(data.data!.original!.accessToken!));
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

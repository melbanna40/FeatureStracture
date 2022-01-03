import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/UI/Main/main_screen.dart';
import 'package:kafey/UI/User/change_password/change_password_screen.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/dependencies/dependency_init.dart';
import 'package:kafey/network/api/ApiResponse/global_response.dart';
import 'package:kafey/network/api/ApiResponse/login_response.dart';
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
          "mac_address": deviceId,
        }, onSuccess: (data) {
      if (data.code == 200) {
        emit(LoginSuccessState());
        CommonUtils.showToastMessage(data.message ?? '');
        Get.to(
          () => ChangePasswordScreen(
            deviceId,
            data.data!.accessToken!,
          ),
        );
        // Get.to(VerifyPhoneScreen());
      } else {
        emit(LoginErrorState());
        CommonUtils.showToastMessage(data.message ?? '');
      }
    }, onError: (code, msg) {
      emit(LoginErrorState());
      CommonUtils.showToastMessage(msg);
    });
  }


}

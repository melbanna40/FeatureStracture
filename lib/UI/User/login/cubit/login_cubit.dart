import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:cubit_template/UI/User/verify_phone/verify_phone_screen.dart';
 import 'package:cubit_template/base/presenter/base_presenter.dart';
import 'package:cubit_template/dependencies/dependency_init.dart';
 import 'package:cubit_template/network/api/network_api.dart';
import 'package:cubit_template/network/net_response.dart';
import 'package:cubit_template/network/network_util.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String? countryCode;
  final BasePresenter _presenter = getIt<BasePresenter>();

  /// --------------- Post Check Phone ------------------ ///
  Future postCheckPhone(String phone) async {
    emit(LoginLoadingState());
    await _presenter.requestFutureData<BaseResponse>(Method.post,
        url: Api.checkPhoneApi,
        options: Options(method: Method.post.toString()),
        params: {"phone": phone}, onSuccess: (data) {
      if (data.code == 200) {
        emit(LoginSuccessState());
        Get.snackbar(
          data.message!,          "",
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.to(VerifyPhoneScreen(phone));
        // Get.to(VerifyPhoneScreen());
      } else {
        emit(LoginErrorState());
        Get.snackbar(
          data.message!,
          "",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }, onError: (code, msg) {
      emit(LoginErrorState());
      Get.snackbar(
       msg,
        "",
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }


}

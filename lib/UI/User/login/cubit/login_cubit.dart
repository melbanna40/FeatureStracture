import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/UI/Main/main_screen.dart';
import 'package:meta/meta.dart';
import 'package:kafey/UI/User/verify_phone/verify_phone_screen.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/dependencies/dependency_init.dart';
import 'package:kafey/network/api/network_api.dart';
import 'package:kafey/network/net_response.dart';
import 'package:kafey/network/network_util.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String? countryCode;
  final BasePresenter _presenter = getIt<BasePresenter>();

  /// --------------- Post Check Phone ------------------ ///
  Future postCheckPhone(String phone) async {
    emit(LoginLoadingState());
    await _presenter.requestFutureData<BaseResponse>(Method.post,
        url: Api.doLoginApiCall,
        options: Options(method: Method.post.toString()),
        params: {"phone": phone},
        onSuccess: (data) {
          if (data.code == 200) {
            emit(LoginSuccessState());
            CommonUtils.showToastMessage(data.message ?? '');
            Get.to(MainScreen());
            // Get.to(VerifyPhoneScreen());
          } else {
            emit(LoginErrorState());
            Get.snackbar(
              data.message!,
              "",
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
        onError: (code, msg) {
          emit(LoginErrorState());
          Get.snackbar(
            msg,
            "",
            snackPosition: SnackPosition.BOTTOM,
          );
        });
  }


}

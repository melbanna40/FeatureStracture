import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/UI/User/login/login_screen.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/dependencies/dependency_init.dart';
import 'package:kafey/network/api/ApiResponse/global_response.dart';
import 'package:kafey/network/api/network_api.dart';
import 'package:kafey/network/network_util.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  bool oldPasswordVisibility = true;
  bool newPasswordVisibility = true;

  void updatePasswordVisibility() {
    oldPasswordVisibility = !oldPasswordVisibility;
    emit(ChangePasswordSuccessState());
  }

  void updateNewPasswordVisibility() {
    newPasswordVisibility = !newPasswordVisibility;
    emit(ChangePasswordSuccessState());
  }

  final BasePresenter _presenter = getIt<BasePresenter>();

  Future doChangePassword(String newPassword, String userToken) async {
    headers["Authorization"] = 'Bearer $userToken';
    emit(ChangePasswordLoadingState());
    await _presenter.requestFutureData<GlobalResponse>(Method.post,
        url: Api.doChangePasswordFirstApiCall,
        options: Options(method: Method.post.toString(), headers: headers),
        params: {
          "password": newPassword,
          // "mac_address": await CommonUtils.getDeviceId(),
        }, onSuccess: (data) {
      if (data.code == 200) {
        emit(ChangePasswordSuccessState());
        Get.offAll(() => LoginScreen());
        // Get.to(VerifyPhoneScreen());
      } else {
        emit(ChangePasswordErrorState());
        CommonUtils.showToastMessage(data.message);
      }
    }, onError: (code, msg) {
      emit(ChangePasswordErrorState());
      CommonUtils.showToastMessage(msg);
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/UI/User/login/login_screen.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/dependencies/dependency_init.dart';
import 'package:kafey/network/api/ApiResponse/change_password_response.dart';
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

  Future doChangePassword(
      String new_password, String user_id, String tenant_id) async {
    emit(ChangePasswordLoadingState());
    await _presenter.requestFutureData<ChangePasswordResponse>(Method.post,
        url: Api.doNewChangePasswordFirstApiCall,
        options: Options(method: Method.post.toString()),
        params: {
          "tenant_id": tenant_id,
          "user_id": user_id,
          "new_password": new_password,
          "mac_address": await CommonUtils.getDeviceId(),
        }, onSuccess: (data) {
      if (data.code == 200) {
        emit(ChangePasswordSuccessState());
        Get.offAll(() => LoginScreen());
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

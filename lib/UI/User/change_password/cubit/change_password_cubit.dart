import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/UI/Main/main_screen.dart';
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
      String newPassword, String userId, String tenantId) async {
    emit(ChangePasswordLoadingState());
    await _presenter.requestFutureData<ChangePasswordResponse>(Method.post,
        url: Api.doNewChangePasswordFirstApiCall,
        options: Options(method: Method.post.toString()),
        params: {
          "tenant_id": tenantId,
          "user_id": userId,
          "new_password": newPassword,
          "mac_address": await CommonUtils.getDeviceId(),
        }, onSuccess: (data) {
      if (data.code == 200) {
        emit(ChangePasswordSuccessState());
        HiveHelper.setUserToken(data.data!.accessToken!);
        Get.offAll(() => const MainScreen());
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

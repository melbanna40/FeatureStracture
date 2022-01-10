import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/UI/Main/main_screen.dart';
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

  void updatePasswordVisibility() {
    oldPasswordVisibility = !oldPasswordVisibility;
    emit(ChangePasswordSuccessState());
  }

  bool newPasswordVisibility = true;

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
          "new_password": newPassword,
        }, onSuccess: (data) {
      if (data.code == 200) {
        emit(ChangePasswordSuccessState());
        HiveHelper.setUserToken(userToken);
        Get.to(() => MainScreen());
        // Get.to(VerifyPhoneScreen());
      } else {
        emit(ChangePasswordErrorState());
        CommonUtils.showToastMessage(data.message ?? '');
      }
    }, onError: (code, msg) {
      emit(ChangePasswordErrorState());
      CommonUtils.showToastMessage(msg);
    });
  }
}

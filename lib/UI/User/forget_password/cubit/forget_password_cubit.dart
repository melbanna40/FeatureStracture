import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/UI/User/change_password/change_password_screen.dart';
import 'package:kafey/UI/User/login/login_screen.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/dependencies/dependency_init.dart';
import 'package:kafey/network/api/ApiResponse/login_response.dart';
import 'package:kafey/network/api/network_api.dart';
import 'package:kafey/network/network_util.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  final BasePresenter _presenter = getIt<BasePresenter>();

  Future doServerLogin(String email) async {
    emit(ForgetPasswordLoading());
    await _presenter.requestFutureData<LoginResponse>(Method.post,
        url: Api.doLoginApiCall,
        options: Options(method: Method.post.toString()),
        params: {
          "email": email,
          "mac_address": await CommonUtils.getDeviceId(),
        }, onSuccess: (data) {
      if (data.code == 200) {
        if (data.data.original.loggedBefore == 0) {
          Get.to(() => ChangePasswordScreen(data.data.original.accessToken));
        } else {
          CommonUtils.showToastMessage(data.message);
          Get.to(() => LoginScreen());
        }
      } else {
        emit(ForgetPasswordError());
        CommonUtils.showToastMessage(data.message);
      }
    }, onError: (code, msg) {
      emit(ForgetPasswordError());
      CommonUtils.showToastMessage(msg);
    });
  }
}

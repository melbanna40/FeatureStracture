import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:cubit_template/CommonUtils/common_utils.dart';
import 'package:cubit_template/UI/Main/main_screen.dart';
import 'package:cubit_template/base/presenter/base_presenter.dart';
import 'package:cubit_template/dependencies/dependency_init.dart';
import 'package:cubit_template/generated/l10n.dart';
import 'package:cubit_template/network/api/network_api.dart';
import 'package:cubit_template/network/net_response.dart';
import 'package:cubit_template/network/network_util.dart';

part 'verify_phone_state.dart';

class VerifyPhoneCubit extends Cubit<VerifyPhoneState> {
  VerifyPhoneCubit() : super(VerifyPhoneInitial());

  final BasePresenter _presenter = getIt<BasePresenter>();

  /// --------------- Post Verify Code ------------------ ///
  Future postLogin(BuildContext context, int phone, int code) async {
    emit(VerifyPhoneLoadingState());

    await _presenter.requestFutureData<BaseResponse>(Method.post,
        url: Api.verifyCodeApi,
        options: Options(method: Method.post.toString()),
        params: {"phone": phone, "code": code}, onSuccess: (data) {
      if (data.code == 200) {
        emit(VerifyPhoneSuccessState());

        // Hive.box(HiveHelper.KEY_BOX_USER_RESPONSE)
        //     .put(HiveHelper.KEY_BOX_USER_RESPONSE, model.userData!.seller!);
        // if (data.userData!.token != null)
        //   Hive.box(HiveHelper.KEY_BOX_TOKEN)
        //       .put(HiveHelper.KEY_BOX_TOKEN, data.userData!.token);

        CommonUtils.showToastMessage(S.of(context).empty_data);
        Get.offAll(() => const MainScreen());
      } else {
        emit(VerifyPhoneErrorState());

        CommonUtils.showToastMessage(S.of(context).empty_data);
      }
    }, onError: (code, msg) {
      emit(VerifyPhoneErrorState());
      CommonUtils.showToastMessage(S.of(context).empty_data);
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'verify_phone_state.dart';

class VerifyPhoneCubit extends Cubit<VerifyPhoneState> {
  VerifyPhoneCubit() : super(VerifyPhoneInitial());

  // final BasePresenter _presenter = getIt<BasePresenter>();

  // VerifyCodeModel model = VerifyCodeModel();

  /// --------------- Post Verify Code ------------------ ///
  Future postLogin(int phone, int code) async {
    // emit(VerifyPhoneLoadingState());
    // await _presenter.requestFutureData<VerifyCodeModel>(Method.post,
    //     url: Api.verifyCodeApi,
    //     newBaseUrl: Api.firstBaseUrl,
    //     options: Options(method: Method.post.toString()),
    //     params: {"phone": phone, "code": code}, onSuccess: (data) {
    //   if (data.code == 200) {
    //     emit(VerifyPhoneSuccessState());
    //     model = data;
    //
    //     Hive.box(HiveHelper.KEY_BOX_USER_RESPONSE)
    //         .put(HiveHelper.KEY_BOX_USER_RESPONSE, model.userData!.seller!);
    //     if (data.userData!.token != null)
    //       Hive.box(HiveHelper.KEY_BOX_TOKEN)
    //           .put(HiveHelper.KEY_BOX_TOKEN, data.userData!.token);
    //
    //     Api.baseUrl = 'https://${data.userData!.seller!.domain!}/api/admin/';
    //
    //     HiveHelper.setBaseUrl(
    //         'https://${data.userData!.seller!.domain!}/api/admin/');
    //
    //     HiveHelper.setTenantId(data.userData!.seller!.tenantId!.toString());
    //
    //
    //     CommonUtils.showToastMessage(data.message ?? '');
    //
    //     Get.offAll(() => const MainScreen());
    //   } else {
    //     emit(VerifyPhoneErrorState());
    //     CommonUtils.showToastMessage(data.message ?? '');
    //   }
    // }, onError: (code, msg) {
    //   emit(VerifyPhoneErrorState());
    //   CommonUtils.showToastMessage(msg);
    // });
  }
}

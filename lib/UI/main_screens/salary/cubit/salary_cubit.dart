
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/UI/User/login/login_screen.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/dependencies/dependency_init.dart';
import 'package:kafey/network/api/ApiResponse/my_leaves_history_response.dart';
import 'package:kafey/network/api/network_api.dart';
import 'package:kafey/network/network_util.dart';

part 'salary_state.dart';

class SalaryCubit extends Cubit<SalaryState> {
  SalaryCubit() : super(SalaryInitial());

  final BasePresenter _presenter = getIt<BasePresenter>();
  List<MyLeavesHistoryData>? mMyLeavesHistoryDataList;

  Future getMyLeavesHistory({List<int>? status}) async {
    emit(SalaryLoading());
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    await _presenter.requestFutureData<MyLeavesHistoryResponse>(Method.get,
        url: Api.getMyLeavesHistoryApiCall,
        options: Options(method: Method.get.toString(), headers: headers),
        params: {
          if (status != null) 'status[]': status,
        }, onSuccess: (data) {
          if (data.code == 200) {
            mMyLeavesHistoryDataList = data.data!;
            emit(SalarySuccess());
          } else if (data.code == 401) {
            Hive.box(HiveHelper.KEY_BOX_TOKEN).clear();
            Get.offAll(LoginScreen());
          } else if (data.code == 400) {
            emit(SalaryError());
            // CommonUtils.showToastMessage(data.message);
          } else {
            emit(SalaryError());
          }
        }, onError: (code, msg) {
          emit(SalaryError());
          CommonUtils.showToastMessage(msg);
        });
  }

}
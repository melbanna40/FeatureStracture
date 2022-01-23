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
import 'package:kafey/network/api/ApiResponse/apply_leave_response.dart';
import 'package:kafey/network/api/ApiResponse/my_leaves_balance_response.dart';
import 'package:kafey/network/api/ApiResponse/my_leaves_history_response.dart';
import 'package:kafey/network/api/network_api.dart';
import 'package:kafey/network/network_util.dart';
import 'package:meta/meta.dart';

part 'leaves_state.dart';

class LeavesCubit extends Cubit<LeavesState> {
  LeavesCubit() : super(LeavesInitial());

  final BasePresenter _presenter = getIt<BasePresenter>();
  MyLeavesBalanceData? mMyLeavesBalanceData;

  Future getMyLeavesBalances() async {
    emit(LeavesLoading());
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    await _presenter.requestFutureData<MyLeavesBalanceResponse>(Method.get,
        url: Api.getMyLeavesBalancesApiCall,
        options: Options(method: Method.get.toString(), headers: headers),
        onSuccess: (data) {
      if (data.code == 200) {
        mMyLeavesBalanceData = data.data;

        emit(LeavesSuccess());
      }
      if (data.code == 400) {
        emit(LeavesSuccess());
        CommonUtils.showToastMessage(data.message);
      } else if (data.code == 401) {
        Hive.box(HiveHelper.KEY_BOX_TOKEN).clear();
        Get.offAll(LoginScreen());
      } else {
        emit(LeavesError());
      }
    }, onError: (code, msg) {
      emit(LeavesError());
      CommonUtils.showToastMessage(msg);
    });
  }

  List<MyLeavesHistoryData>? mMyLeavesHistoryDataList;

  Future getMyLeavesHistory() async {
    emit(LeavesLoading());
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    await _presenter.requestFutureData<MyLeavesHistoryResponse>(Method.get,
        url: Api.getMyLeavesHistoryApiCall,
        options: Options(method: Method.get.toString(), headers: headers),
        onSuccess: (data) {
      if (data.code == 200) {
        mMyLeavesHistoryDataList = data.data!;
        emit(LeavesSuccess());
      } else if (data.code == 401) {
        Hive.box(HiveHelper.KEY_BOX_TOKEN).clear();
        Get.offAll(LoginScreen());
      } else if (data.code == 400) {
        emit(LeavesError());
        // CommonUtils.showToastMessage(data.message);
      } else {
        emit(LeavesError());
      }
    }, onError: (code, msg) {
      emit(LeavesError());
      CommonUtils.showToastMessage(msg);
    });
  }

  Future applyLeave(Map<String, dynamic> data) async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    await _presenter.requestFutureData<ApplyLeaveResponse>(Method.post,
        url: Api.postApplyForLeaveApiCall,
        options: Options(method: Method.post.toString(), headers: headers),
        params: data, onSuccess: (data) {
      if (data.code == 200) {
        CommonUtils.showToastMessage(data.message);
        getMyLeavesBalances();
        getMyLeavesHistory();
        emit(LeavesSuccess());
      } else if (data.code == 401) {
        Hive.box(HiveHelper.KEY_BOX_TOKEN).clear();
        Get.offAll(LoginScreen());
      } else if (data.code == 400) {
        CommonUtils.showToastMessage(data.message);
        emit(LeavesError());
      }
    }, onError: (code, msg) {
      emit(LeavesError());
      CommonUtils.showToastMessage(msg);
    });
  }
}

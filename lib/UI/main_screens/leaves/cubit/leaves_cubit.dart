import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/dependencies/dependency_init.dart';
import 'package:kafey/network/api/ApiResponse/global_response.dart';
import 'package:kafey/network/api/ApiResponse/my_leaves_balance_response.dart';
import 'package:kafey/network/api/ApiResponse/my_leaves_history_response.dart';
import 'package:kafey/network/api/ApiResponse/my_leaves_types_response.dart';
import 'package:kafey/network/api/network_api.dart';
import 'package:kafey/network/network_util.dart';
import 'package:meta/meta.dart';

part 'leaves_state.dart';

class LeavesCubit extends Cubit<LeavesState> {
  LeavesCubit() : super(LeavesInitial());

  final BasePresenter _presenter = getIt<BasePresenter>();
  MyLeavesBalanceData? mMyLeavesBalanceData;

  Future getMyLeavesBalances() async {
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
      } else {
        emit(LeavesError());
        CommonUtils.showToastMessage(data.message);
      }
    }, onError: (code, msg) {
      emit(LeavesError());
      CommonUtils.showToastMessage(msg);
    });
  }

  List<MyLeavesTypesData>? mMyLeavesTypesDataList;

  Future getMyLeavesTypes() async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    await _presenter.requestFutureData<MyLeavesTypesResponse>(Method.get,
        url: Api.getMyLeavesTypesApiCall,
        options: Options(method: Method.get.toString(), headers: headers),
        onSuccess: (data) {
      if (data.code == 200) {
        mMyLeavesTypesDataList = data.data;
        emit(LeavesSuccess());
      }
      if (data.code == 400) {
        emit(LeavesError());
      } else {
        emit(LeavesError());
        CommonUtils.showToastMessage(data.message);
      }
    }, onError: (code, msg) {
      emit(LeavesError());
      CommonUtils.showToastMessage(msg);
    });
  }

  List<MyLeavesHistoryData>? mMyLeavesHistoryDataList;

  Future getMyLeavesHistory() async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    await _presenter.requestFutureData<MyLeavesHistoryResponse>(Method.get,
        url: Api.getMyLeavesHistoryApiCall,
        options: Options(method: Method.get.toString(), headers: headers),
        onSuccess: (data) {
      if (data.code == 200) {
        mMyLeavesHistoryDataList = data.data;
        emit(LeavesSuccess());
      }
      if (data.code == 400) {
        emit(LeavesError());
      } else {
        emit(LeavesError());
        CommonUtils.showToastMessage(data.message);
      }
    }, onError: (code, msg) {
      emit(LeavesError());
      CommonUtils.showToastMessage(msg);
    });
  }

  Future applyLeave(Map<String, dynamic> data) async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    await _presenter.requestFutureData<GlobalResponse>(Method.post,
        url: Api.doLoginApiCall,
        options: Options(method: Method.post.toString(), headers: headers),
        params: data, onSuccess: (data) {
      if (data.code == 200) {
        CommonUtils.showToastMessage(data.message);
        emit(LeavesSuccess());
      } else {
        emit(LeavesError());
      }
    }, onError: (code, msg) {
      emit(LeavesError());
      CommonUtils.showToastMessage(msg);
    });
  }
}

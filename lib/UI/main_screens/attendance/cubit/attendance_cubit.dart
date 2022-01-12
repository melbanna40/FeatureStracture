import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/dependencies/dependency_init.dart';
import 'package:kafey/network/api/ApiResponse/attendance_history_response.dart';
import 'package:kafey/network/api/ApiResponse/global_response.dart';
import 'package:kafey/network/api/network_api.dart';
import 'package:kafey/network/network_util.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());

  final BasePresenter _presenter = getIt<BasePresenter>();
  List<AttendanceHistoryData>? mAttendanceHistoryDataList;

  DateTime? attendanceDay = DateTime.now();

  void updateAttendanceDate(DateTime newDate) {
    attendanceDay = newDate;
    // Log.e(DateFormat('y-M','en').format(newDate).replaceAll('/', '-'));
    getAttendanceHistoryApiCal(
        date: DateFormat('y-M', 'en').format(newDate).replaceAll('/', '-'));
  }

  Future getAttendanceHistoryApiCal({String? date}) async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    emit(AttendanceLoading());
    await _presenter.requestFutureData<AttendanceHistoryResponse>(Method.get,
        url: Api.getAttendanceHistoryApiCall,
        options: Options(method: Method.get.toString(), headers: headers),
        queryParams: {'date': date}, onSuccess: (data) {
      if (data.code == 200) {
        mAttendanceHistoryDataList = data.data!;
        emit(AttendanceSuccess());
      } else {
        emit(AttendanceError());
        CommonUtils.showToastMessage(data.message ?? '');
      }
    }, onError: (code, msg) {
      emit(AttendanceError());
      CommonUtils.showToastMessage(msg);
    });
  }

  Future updateAttendanceRequestApiCall(
      BuildContext context, String id, Map<String, dynamic> map) async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    emit(AttendanceLoading());

    await _presenter.requestFutureData<GlobalResponse>(Method.post,
        url: Api.doUpdateAttendanceRequestApiCall(id),
        options: Options(method: Method.post.toString(), headers: headers),
        params: map, onSuccess: (data) {
      if (data.code == 200) {
        getAttendanceHistoryApiCal();
        emit(AttendanceSuccess());
      } else {
        emit(AttendanceError());
        CommonUtils.showToastMessage(data.message);
      }
    }, onError: (code, msg) {
      emit(AttendanceError());
      CommonUtils.showToastMessage(msg);
    });
  }
}

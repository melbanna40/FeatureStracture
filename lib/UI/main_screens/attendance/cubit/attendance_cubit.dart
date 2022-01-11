import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/UI/main_screens/attendance/widget/time_updated_dialog.dart';
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
    emit(AttendanceSuccess());
  }

  Future getAttendanceHistoryApiCal() async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    emit(AttendanceLoading());
    await _presenter.requestFutureData<AttendanceHistoryResponse>(Method.get,
        url: Api.getAttendanceHistoryApiCall,
        options: Options(method: Method.get.toString(), headers: headers),
        onSuccess: (data) {
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
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return TimeUpdatedDialog();
            });
        getAttendanceHistoryApiCal();
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
}

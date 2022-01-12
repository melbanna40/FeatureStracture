import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/dependencies/dependency_init.dart';
import 'package:kafey/network/api/ApiResponse/attendance_history_response.dart';
import 'package:kafey/network/api/ApiResponse/global_response.dart';
import 'package:kafey/network/api/network_api.dart';
import 'package:kafey/network/network_util.dart';

part 'notification_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  final BasePresenter _presenter = getIt<BasePresenter>();
  // List<NotificationsHistoryData>? mNotificationsHistoryDataList;

  Future getNotificationsHistoryApiCal() async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    emit(NotificationsLoading());
    await _presenter.requestFutureData<GlobalResponse>(Method.get,
        url: Api.getNotificationsHistoryApiCall,
        options: Options(method: Method.get.toString(), headers: headers),
        onSuccess: (data) {
      if (data.code == 200) {
        // mNotificationsHistoryDataList = data.data!;
        emit(NotificationsSuccess());
       } else {
        emit(NotificationsError());
        CommonUtils.showToastMessage(data.message);
      }
    }, onError: (code, msg) {
      emit(NotificationsError());
      CommonUtils.showToastMessage(msg);
    });
  }
}

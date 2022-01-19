import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/dependencies/dependency_init.dart';
import 'package:kafey/network/api/ApiResponse/notifications_response.dart';
import 'package:kafey/network/api/network_api.dart';
import 'package:kafey/network/network_util.dart';

part 'notification_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  final BasePresenter _presenter = getIt<BasePresenter>();
  List<NotificationData>? mNotificationDataList;

  Future getNotificationsHistoryApiCal() async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC90ZXN0LmlrYWZleS54eXpcL2FwaVwvbG9naW4iLCJpYXQiOjE2NDI0MjcwODcsIm5iZiI6MTY0MjQyNzA4NywianRpIjoiaVJhWlZ2eVk0N1k1cVhjRSIsInN1YiI6MzAsInBydiI6IjEzY2IxYjM3M2Y5M2MzYjhhODY5Zjg5MWZkZTU0YzlmMTNiNzJjNTYifQ.xtedZIqZCZQz867rWPBxsuPp1o5eGR6jVv6lRfZ-emo';
    emit(NotificationsLoading());
    await _presenter.requestFutureData<NotificationsResponse>(Method.get,
        url: Api.getNotificationsHistoryApiCall,
        options: Options(method: Method.get.toString(), headers: headers),
        onSuccess: (data) {
      if (data.code == 200) {
        mNotificationDataList = data.data!;
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

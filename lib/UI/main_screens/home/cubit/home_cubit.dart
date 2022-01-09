import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/dependencies/dependency_init.dart';
import 'package:kafey/network/api/ApiResponse/global_response.dart';
import 'package:kafey/network/api/ApiResponse/home_statistics_response.dart';
import 'package:kafey/network/api/network_api.dart';
import 'package:kafey/network/network_util.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  BasePresenter? mPresenter = BasePresenter();

  String? currentDate;
  String? currentTime;

  bool? isLogged = false;

  RadialGradient currentGradient = RadialGradient(
    tileMode: TileMode.mirror,
    colors: [
      Colors.lightBlue,
      Colors.deepPurpleAccent,
    ],
  );

  void updateCurrentDateTime() {
    initializeDateFormatting("en_us", '');
    currentDate = DateFormat.yMMMMEEEEd('en_us').format(DateTime.now());
    currentTime = DateFormat.Hm('en_us').format(DateTime.now());
    emit(UpdateCurrentDateState());
  }

  void updateClickOnState() {
    isLogged = !isLogged!;
    if (isLogged!) {
      doClockInApiCal();
    }
    else {
      doClockOutApiCal();
    }
    emit(UpdateCurrentDateState());
  }

  final BasePresenter _presenter = getIt<BasePresenter>();

  Future getHomeStatistics() async {
    emit(HomeLoading());
    await _presenter.requestFutureData<HomeStatisticsResponse>(Method.get,
        url: Api.getHomeStatisticsApiCall,
        options: Options(method: Method.get.toString()), onSuccess: (data) {
          if (data.code == 200) {
            emit(HomeSuccess());
            CommonUtils.showToastMessage(data.message ?? '');
          } else {
            emit(HomeError());
            CommonUtils.showToastMessage(data.message ?? '');
          }
        }, onError: (code, msg) {
          emit(HomeError());
          CommonUtils.showToastMessage(msg);
        });
  }

  Future doClockInApiCal() async {
    emit(HomeLoading());
    await _presenter.requestFutureData<GlobalResponse>(Method.get,
        url: Api.doClockInApiCall,
        options: Options(method: Method.get.toString()), onSuccess: (data) {
          if (data.code == 200) {
            emit(HomeSuccess());
            CommonUtils.showToastMessage(data.message ?? '');
          } else {
            emit(HomeError());
            CommonUtils.showToastMessage(data.message ?? '');
          }
        }, onError: (code, msg) {
          emit(HomeError());
          CommonUtils.showToastMessage(msg);
        });
  }

  Future doClockOutApiCal() async {
    emit(HomeLoading());
    await _presenter.requestFutureData<GlobalResponse>(Method.get,
        url: Api.doClockOutApiCall,
        options: Options(method: Method.get.toString()), onSuccess: (data) {
          if (data.code == 200) {
            emit(HomeSuccess());
            CommonUtils.showToastMessage(data.message ?? '');
          } else {
            emit(HomeError());
            CommonUtils.showToastMessage(data.message ?? '');
          }
        }, onError: (code, msg) {
          emit(HomeError());
          CommonUtils.showToastMessage(msg);
        });
  }
}

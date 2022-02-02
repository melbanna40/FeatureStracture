import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/Helpers/LocationHelper.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/UI/User/login/login_screen.dart';
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
  String? currentLocation;

  bool? isLogged = false;

  RadialGradient currentGradient = RadialGradient(
    tileMode: TileMode.mirror,
    colors: [
      Colors.lightBlue,
      Colors.deepPurpleAccent,
    ],
  );

  void updateCurrentLocation() async {
    var location = await LocationHelper.determinePosition();
    try {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      currentLocation = placeMarks.first.street;

      emit(UpdateCurrentDateState());
    } catch (e) {
      CommonUtils.showToastMessage(e.toString());
    }
  }

  void updateCurrentDateTime() {
    initializeDateFormatting("en_us", '');
    currentDate = DateFormat.yMEd('ar').format(DateTime.now());
    currentTime = DateFormat.Hm('ar').format(DateTime.now());
    emit(UpdateCurrentDateState());
  }

  void updateClickOnState() {
    if (!isLogged!) {
      doClockInApiCal();
    } else {
      doClockOutApiCal();
    }
  }

  final BasePresenter _presenter = getIt<BasePresenter>();
  HomeStatisticsData? mHomeStatisticsData;

  Future getHomeStatistics() async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    await _presenter.requestFutureData<HomeStatisticsResponse>(Method.get,
        url: Api.getHomeStatisticsApiCall,
        options: Options(method: Method.get.toString(), headers: headers),
        onSuccess: (data) {
      if (data.code == 200) {
        mHomeStatisticsData = data.data!;
        if (data.data!.clockIn != null &&
            (data.data!.clockOut == null || data.data!.clockOut!.isEmpty)) {
          isLogged = true;
        }
        emit(UpdateCurrentDateState());
        emit(HomeSuccess());
      } else if (data.code == 400) {
        CommonUtils.showToastMessage(data.message);
        emit(HomeSuccess());
      } else if (data.code == 401) {
        Hive.box(HiveHelper.KEY_BOX_TOKEN).clear();
        Get.offAll(LoginScreen());
      } else {
        CommonUtils.showToastMessage(data.message);
        emit(HomeError());
      }
    }, onError: (code, msg) {
      emit(HomeError());
      CommonUtils.showToastMessage(msg);
    });
  }

  Future doClockInApiCal() async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    var location = await LocationHelper.determinePosition();

    CommonUtils.showToastMessage('جآر التحميل');
    await _presenter.requestFutureData<GlobalResponse>(Method.post,
        url: Api.doClockInApiCall,
        options: Options(method: Method.post.toString(), headers: headers),
        params: {'lat': location.latitude, 'lng': location.longitude},
        // params: {'lat': '24.774265', 'lng': '46.738586'},
        onSuccess: (data) {
      if (data.code == 200) {
        emit(HomeSuccess());
        isLogged = !isLogged!;
        emit(UpdateCurrentDateState());
        getHomeStatistics();
      } else if (data.code == 400) {
        CommonUtils.showToastMessage(data.message);
        emit(HomeError());
      }
    }, onError: (code, msg) {
      emit(HomeError());
      CommonUtils.showToastMessage(msg);
    });
  }

  Future doClockOutApiCal() async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    var location = await LocationHelper.determinePosition();
    CommonUtils.showToastMessage('جآر التحميل');
    await _presenter.requestFutureData<GlobalResponse>(Method.post,
        url: Api.doClockOutApiCall,
        options: Options(method: Method.post.toString(), headers: headers),
        params: {'lat': location.latitude, 'lng': location.longitude},
        // params: {'lat': '24.774265', 'lng': '46.738586'},
        onSuccess: (data) {
      if (data.code == 200) {
        emit(HomeSuccess());
        isLogged = !isLogged!;
        emit(UpdateCurrentDateState());
        getHomeStatistics();
      } else if (data.code == 400) {
        CommonUtils.showToastMessage(data.message);
        emit(HomeError());
      }
    }, onError: (code, msg) {
      emit(HomeError());
      CommonUtils.showToastMessage(msg);
    });
  }

  void clearData() {
    Hive.box(HiveHelper.KEY_BOX_TOKEN).clear();
    Hive.box(HiveHelper.KEY_APP_BASE_URL).clear();
    Hive.box(HiveHelper.KEY_BOX_USER_RESPONSE).clear();
    Get.offAll(() => LoginScreen());
  }

  Future doLogoutApiCall() async {
    clearData();
    // headers[HttpHeaders.authorizationHeader] =
    //     "Bearer " + HiveHelper.getUserToken();
    // CommonUtils.showToastMessage('جآر التحميل');
    // await _presenter.requestFutureData<GlobalResponse>(Method.post,
    //     url: Api.doLogoutApiCall,
    //     options: Options(method: Method.post.toString(), headers: headers),
    //     onSuccess: (data) {
    //   if (data.code == 200) {
    //     emit(HomeSuccess());
    //     CommonUtils.showToastMessage(data.message);
    //     clearData();
    //   } else if (data.code == 400) {
    //     CommonUtils.showToastMessage(data.message);
    //     emit(HomeError());
    //   }
    // }, onError: (code, msg) {
    //   emit(HomeError());
    //   CommonUtils.showToastMessage(msg);
    // });
  }

  Future getUserDataApiCal() async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    await _presenter.requestFutureData<GlobalResponse>(Method.post,
        url: Api.getUserDataApiCal,
        options: Options(method: Method.post.toString(), headers: headers),
        onSuccess: (data) {
      if (data.code == 200) {
        emit(HomeSuccess());
      } else if (data.code == 400) {
        CommonUtils.showToastMessage(data.message);
        emit(HomeError());
      }
    }, onError: (code, msg) {
      emit(HomeError());
      CommonUtils.showToastMessage(msg);
    });
  }
}

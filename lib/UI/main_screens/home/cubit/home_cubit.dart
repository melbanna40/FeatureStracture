import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:kafey/base/presenter/base_presenter.dart';

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
    emit(UpdateCurrentDateState());
  }

// void getAllProductsApiCall() async {
//   emit(HomeLoading());
//   await mPresenter!.requestFutureData<BaseResponse>(Method.get,
//       url: Api.getAllProductsApiCall,
//       options: Options(method: Method.get.toString(), headers: headers),
//       onSuccess: (data) {
//     emit(HomeSuccess());
//   }, onError: (code, msg) {
//     emit(HomeError());
//   });
// }
}

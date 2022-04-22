import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:byaan/CommonUtils/log_utils.dart';
import 'package:byaan/Helpers/network_connection_helper.dart';
import 'package:byaan/features/temp/data/models/temp_response_entity.dart';
import 'package:byaan/features/temp/domain/repository/temp_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'temp_state.dart';

@Injectable()
class TempCubit extends Cubit<TempState> {
  final TempRepository mRepository;

  TempCubit(this.mRepository) : super(TempInitial());

  Future<void> getTempData() async {
    emit(const TempDataLoading());
    final response = await mRepository.getTempDataApiCall();
    emit(response.fold(TempDataFailed.new, TempDataSuccessful.new));
  }

  void init() async {
    await NetworkConnectionManger.initNetworkConnectivity();
    NetworkConnectionManger.mConnectivity.onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(TempDataFailed(result.toString()));
      } else if (result == ConnectivityResult.none) {
        emit(TempDataFailed(result.toString()));
      } else {
        emit(TempDataFailed(result.toString()));
      }
      Log.e(result.name);
    });
  }
}

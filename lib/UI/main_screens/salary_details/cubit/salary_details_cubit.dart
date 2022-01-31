import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/Helpers/hivr_helper.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/dependencies/dependency_init.dart';
import 'package:kafey/network/api/ApiResponse/salary_details_response.dart';
import 'package:kafey/network/api/network_api.dart';
import 'package:kafey/network/network_util.dart';

part 'salary_details_state.dart';

class SalaryDetailsCubit extends Cubit<SalaryDetailsState> {
  SalaryDetailsCubit() : super(SalaryDetailsInitial());

  final BasePresenter _presenter = getIt<BasePresenter>();
  SalaryDetailsData? mSalaryDetailsData;

  Future getSalaryDetailsApiCal() async {
    headers[HttpHeaders.authorizationHeader] =
        "Bearer " + HiveHelper.getUserToken();
    emit(SalaryDetailsLoading());
    await _presenter.requestFutureData<SalaryDetailsResponse>(Method.get,
        url: Api.getSalaryDetailsApiCall,
        options: Options(method: Method.get.toString(), headers: headers),
        onSuccess: (data) {
      if (data.code == 200) {
        mSalaryDetailsData = data.data!;
        emit(SalaryDetailsSuccess());
      } else {
        emit(SalaryDetailsError());
        CommonUtils.showToastMessage(data.message);
      }
    }, onError: (code, msg) {
      emit(SalaryDetailsError());
      CommonUtils.showToastMessage(msg);
    });
  }
}

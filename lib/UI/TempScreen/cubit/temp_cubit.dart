import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:cubit_template/base/presenter/base_presenter.dart';
 import 'package:cubit_template/network/api/network_api.dart';
import 'package:cubit_template/network/net_response.dart';
import 'package:cubit_template/network/network_util.dart';

part 'temp_state.dart';

class TempCubit extends Cubit<TempState> {
  TempCubit() : super(TempInitial());
  BasePresenter? mPresenter=BasePresenter();

  void getAllProductsApiCall() async {
    emit(TempLoading());
    await mPresenter!.requestFutureData<BaseResponse>(Method.get,
        url: Api.getAllProductsApiCall,
        options: Options(method: Method.get.toString(), headers: headers),
        onSuccess: (data) {
      emit(TempSuccess());
     }, onError: (code, msg) {
      emit(TempError());
    });
  }
}

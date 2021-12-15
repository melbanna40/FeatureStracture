import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kafey/base/presenter/base_presenter.dart';
import 'package:kafey/network/api/network_api.dart';
import 'package:kafey/network/net_response.dart';
import 'package:kafey/network/network_util.dart';
import 'package:meta/meta.dart';

part 'temp_state.dart';

class TempCubit extends Cubit<TempState> {
  TempCubit() : super(TempInitial());
  BasePresenter? mPresenter = BasePresenter();

  void getAllProductsApiCall() async {
    emit(TempLoading());
    await mPresenter!.requestFutureData<BaseResponse>(Method.get,
        url: Api.doLoginApiCall,
        options: Options(method: Method.get.toString(), headers: headers),
        onSuccess: (data) {
      emit(TempSuccess());
    }, onError: (code, msg) {
      emit(TempError());
    });
  }
}

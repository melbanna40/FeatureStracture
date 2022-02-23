import 'package:dartz/dartz.dart';
import 'package:dev_banna/CommonUtils/log_utils.dart';
import 'package:dev_banna/dependencies/dependency_init.dart';
import 'package:dev_banna/features/temp/data/models/temp_response_entity.dart';
import 'package:dev_banna/network/api/network_api.dart';
import 'package:dev_banna/network/base_presenter.dart';
import 'package:dev_banna/network/network_util.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

typedef EitherTempResponse = Either<String, TempDataModelResource>;

@Injectable()
class TempNetworkService {
  final BaseApiHelper _presenter = getIt<BaseApiHelper>();

  Future<EitherTempResponse> getTempDataApiCall() async {
    EitherTempResponse mResponse = left("");

    await _presenter.requestFutureData<TempResponseEntity>(
      Method.get,
      options: Options(method: Method.get.toString(), headers: headers),
      newBaseUrl: Api.tempBaseUrl,
      url: Api.getTempDataApiCall,
      onSuccess: (data) {
        Log.json(data.toJson().toString());
        mResponse = right(data.data);
      },
      onError: (code, msg) {
        Log.e(msg);
        mResponse = left(msg);
      },
    );
    return mResponse;
  }
}

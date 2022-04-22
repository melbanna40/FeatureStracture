import 'package:dartz/dartz.dart';
import 'package:byaan/CommonUtils/log_utils.dart';
import 'package:byaan/dependencies/dependency_init.dart';
import 'package:byaan/features/temp/data/models/temp_response_entity.dart';
import 'package:byaan/network/api/network_api.dart';
import 'package:byaan/network/base_presenter.dart';
import 'package:byaan/network/network_util.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

typedef EitherTempResponse = Either<String, TempDataModelResource>;

@Injectable()
class TempNetworkService {
  final BaseApiHelper _presenter = getIt<BaseApiHelper>();

  Future<EitherTempResponse> getTempDataApiCall() async {
    EitherTempResponse? mResponse;

    await _presenter.requestFutureData<TempResponseEntity>(
      Method.get,
      options: Options(method: Method.get.toString(), headers: headers),
      newBaseUrl: Api.tempBaseUrl,
      url: Api.getTempDataApiCall,
      onSuccess: (data) {
        if (data.status == 200) {
          mResponse = right(data.data);
        } else {
          mResponse = left(data.message!);
        }
      },
      onError: (code, msg) {
        Log.e(msg);
        mResponse = left(msg);
      },
    );
    return mResponse!;
  }
}

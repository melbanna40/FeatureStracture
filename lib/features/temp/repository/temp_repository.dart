import 'package:dev_banna/features/temp/data/services/network_service.dart';
import 'package:injectable/injectable.dart';
@Injectable()
class TempRepository {
  final TempNetworkService mWebService;

  TempRepository(this.mWebService);

  Future<EitherTempResponse> getTempDataApiCall() async {
    return await mWebService.getTempDataApiCall();
  }

}

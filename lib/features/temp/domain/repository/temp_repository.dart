import 'package:byaan/features/temp/data/services/network_service.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class TempRepository {
  final TempNetworkService mWebService;

  TempRepository(this.mWebService);

  Future<EitherTempResponse> getTempDataApiCall() async {
    return await mWebService.getTempDataApiCall();
  }
}

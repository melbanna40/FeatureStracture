import 'package:dev_banna/features/temp/data/models/temp_response_entity.dart';
import 'package:dev_banna/network/net_response.dart';

class EntityFactory {
  static T? generateOBJ<T>(json) {
    if (T.toString() == "BaseResponse") {
      return BaseResponse.fromJson(json) as T;
    } else if (T.toString() == "TempResponseEntity") {
      return TempResponseEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}

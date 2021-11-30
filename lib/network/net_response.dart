
import 'package:cubit_template/CommonUtils/base_response_constants.dart';

import 'entity_factory.dart';

///Basic classes for data analysis
class BaseResponse<T> {
  int? code;
  String? message;
  T ?data;
  List<T> ?listData = [];

  BaseResponse(this.code, this.message, this.data);

  BaseResponse.fromJson(Map<String, dynamic> json) {
    code = json[BaseResponseConstants.code];
    message = json[BaseResponseConstants.message];
    if (json.containsKey(BaseResponseConstants.data)) {
      if (json[BaseResponseConstants.data] is List) {
        for (var item in (json[BaseResponseConstants.data] as List)) {
          if (T.toString() == "String") {
            listData!.add(item.toString() as T);
          } else {
            listData!.add(EntityFactory.generateOBJ<T>(item)!);
          }
        }
      } else {
        if (T.toString() == "String") {
          data = json[BaseResponseConstants.data].toString() as T;
        } else if (T.toString() == "Map<dynamic, dynamic>") {
          data = json[BaseResponseConstants.data] as T;
        } else {
          data = EntityFactory.generateOBJ(json[BaseResponseConstants.data]);
        }
      }
    }
  }
}

import '../res/constant.dart';
import 'entity_factory.dart';

///Basic classes for data analysis
class BaseResponse<T> {
  int? code;
  String? message;
  T? data;
  List<T>? listData = [];

  BaseResponse(this.code, this.message, this.data);

  BaseResponse.fromJson(Map<String, dynamic> json) {
    code = json[AppConstant.code];
    message = json[AppConstant.message];
    if (json.containsKey(AppConstant.data)) {
      if (json[AppConstant.data] is List) {
        for (var item in (json[AppConstant.data] as List)) {
          if (T.toString() == "Striang") {
            listData!.add(item.toString() as T);
          } else {
            listData!.add(EntityFactory.generateOBJ<T>(item)!);
          }
        }
      } else {
        if (T.toString() == "String") {
          data = json[AppConstant.data].toString() as T;
        } else if (T.toString() == "Map<dynamic, dynamic>") {
          data = json[AppConstant.data] as T;
        } else {
          data = EntityFactory.generateOBJ(json[AppConstant.data]);
        }
      }
    }
  }
}

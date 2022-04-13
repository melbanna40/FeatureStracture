import 'package:byaan/features/auth/login/data/model/user_model/user_model.dart';
import 'package:byaan/features/home/data/model/home_model/home_model.dart';

 import 'base_response/general_response.dart';
import 'net_response.dart';

class EntityFactory {
  static T? generateOBJ<T>(json) {
    if (T.toString() == "BaseResponse") {
      return BaseResponse.fromJson(json) as T;
    } else if (T.toString() == "GeneralResponse") {
      return GeneralResponse.fromJson(json) as T;
    } else if (T.toString() == "UserModel") {
      return UserModel.fromJson(json) as T;
    } else if (T.toString() == "HomeModel") {
      return HomeModel.fromJson(json) as T;
    } else {
      return null;
    }
  }
}

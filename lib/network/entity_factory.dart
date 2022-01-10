import 'package:kafey/network/api/ApiResponse/attendance_history_response.dart';
import 'package:kafey/network/api/ApiResponse/global_response.dart';
import 'package:kafey/network/api/ApiResponse/home_statistics_response.dart';
import 'package:kafey/network/api/ApiResponse/login_response.dart';

class EntityFactory {
  static T? generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "LoginResponse") {
      return LoginResponse.fromJson(json) as T;
    } else if (T.toString() == "GlobalResponse") {
      return GlobalResponse.fromJson(json) as T;
    } else if (T.toString() == "HomeStatisticsResponse") {
      return HomeStatisticsResponse.fromJson(json) as T;
    } else if (T.toString() == "AttendanceHistoryResponse") {
      return AttendanceHistoryResponse.fromJson(json) as T;
    }
    //
    // else if (T.toString() == "ProductsResponse") {
    //   return ProductsResponse.fromJson(json) as T;
    // } //
    //
    // else if (T.toString() == "ProductsResponse") {
    //   return ProductsResponse.fromJson(json) as T;
    // } //
    //
    // else if (T.toString() == "ProductsResponse") {
    //   return ProductsResponse.fromJson(json) as T;
    // }
    else {
      return null;
    }
  }
}

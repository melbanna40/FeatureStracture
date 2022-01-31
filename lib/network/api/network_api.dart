import 'package:kafey/Helpers/hivr_helper.dart';

class Api {
  //base Url

  static String baseUrl = HiveHelper.getBaseUrl();

  static const String firstBaseUrl = "http://ikafey.xyz/api/";

  static const String doLoginApiCall = "login";
  static const String doNewLoginApiCall = "new-login";

  static const String doChangePasswordFirstApiCall = "change-password";
  static const String doNewChangePasswordFirstApiCall =
      "change-employee-password";

  static const String getHomeStatisticsApiCall = "ess/home-statistics-today";

  static const String doClockInApiCall = "ess/clock-in";

  static const String doClockOutApiCall = "ess/clock-out";

  static String doUpdateAttendanceRequestApiCall(String id) =>
      "ess/edit_attendance_request/${id}";

  static const String getAttendanceHistoryApiCall = "ess/attendance-history";

  static const String getMyLeavesBalancesApiCall = "ess/my-leaves-balances";

  static const String getMyLeavesTypesApiCall = "ess/my-leaves-types";

  static const String postApplyForLeaveApiCall = "ess/apply-leave";

  static const String getMyLeavesHistoryApiCall = "ess/my-leaves-history";

  static const String getMySalariesHistoryApiCall = "hr/salaries-of-month";

  static const String getSalaryDetailsApiCall =
      "hr/get-details-of-single-salary";

  static const String postNotificationsDeviceTokenApiCall =
      "user/generate-device-token";

  static const String getNotificationsHistoryApiCall =
      "user/user-notifications-history";

  static const String doLogoutApiCall = "logout";
}

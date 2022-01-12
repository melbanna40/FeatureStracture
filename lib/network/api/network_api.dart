class Api {
  //base Url
  static const String baseUrl = "http://test.ikafey.xyz/api/";

  static const String doLoginApiCall = "login";

  static const String doChangePasswordFirstApiCall = "change-password";



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


  static const String postNotificationsDeviceTokenApiCall =
      "user/generate-device-token";

  static const String getNotificationsHistoryApiCall =
      "user/user-notifications-history";

  static const String doLogoutApiCall = "logout";

}

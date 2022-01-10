class AttendanceHistoryResponse {
  AttendanceHistoryResponse({
      int? code, 
      List<AttendanceHistoryData>? data,
      String? message,}){
    _code = code;
    _data = data;
    _message = message;
}

  AttendanceHistoryResponse.fromJson(dynamic json) {
    _code = json['code'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AttendanceHistoryData.fromJson(v));
      });
    }
    _message = json['message'];
  }
  int? _code;
  List<AttendanceHistoryData>? _data;
  String? _message;

  int? get code => _code;
  List<AttendanceHistoryData>? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }

}

class AttendanceHistoryData {
  AttendanceHistoryData({
      int? id, 
      String? clockIn, 
      String? clockOut,
    String? hoursPerDay,
      int? dayOfMonth, 
      String? dayOfWeek,}){
    _id = id;
    _clockIn = clockIn;
    _clockOut = clockOut;
    _hoursPerDay = hoursPerDay;
    _dayOfMonth = dayOfMonth;
    _dayOfWeek = dayOfWeek;
}

  AttendanceHistoryData.fromJson(dynamic json) {
    _id = json['id'];
    _clockIn = json['clock_in'];
    _clockOut = json['clock_out'];
    _hoursPerDay = json['hours_per_day'].toString();
    _dayOfMonth = json['day_of_month'];
    _dayOfWeek = json['day_of_week'];
  }
  int? _id;
  String? _clockIn;
  String? _clockOut;
  String? _hoursPerDay;
  int? _dayOfMonth;
  String? _dayOfWeek;

  int? get id => _id;
  String? get clockIn => _clockIn;
  String? get clockOut => _clockOut;
  String? get hoursPerDay => _hoursPerDay;
  int? get dayOfMonth => _dayOfMonth;
  String? get dayOfWeek => _dayOfWeek;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['clock_in'] = _clockIn;
    map['clock_out'] = _clockOut;
    map['hours_per_day'] = _hoursPerDay;
    map['day_of_month'] = _dayOfMonth;
    map['day_of_week'] = _dayOfWeek;
    return map;
  }

}
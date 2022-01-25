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
      String? clockIn, 
      String? clockOut, 
      String? hoursPerDay, 
      String? date, 
      int? dayOfMonth, 
      String? dayOfWeek, 
      int? clockInStatus, 
      int? status, 
      bool? isHoliday,}){
    _clockIn = clockIn;
    _clockOut = clockOut;
    _hoursPerDay = hoursPerDay;
    _date = date;
    _dayOfMonth = dayOfMonth;
    _dayOfWeek = dayOfWeek;
    _clockInStatus = clockInStatus;
    _status = status;
    _isHoliday = isHoliday;
}

  AttendanceHistoryData.fromJson(dynamic json) {
    _clockIn = json['clock_in'];
    _clockOut = json['clock_out'];
    _hoursPerDay = json['hours_per_day'];
    _date = json['date'];
    _dayOfMonth = json['day_of_month'];
    _dayOfWeek = json['day_of_week'];
    _clockInStatus = json['clock_in_status'];
    _status = json['status'];
    _isHoliday = json['is_holiday'];
  }
  String? _clockIn;
  String? _clockOut;
  String? _hoursPerDay;
  String? _date;
  int? _dayOfMonth;
  String? _dayOfWeek;
  int? _clockInStatus;
  int? _status;
  bool? _isHoliday;

  String? get clockIn => _clockIn;
  String? get clockOut => _clockOut;
  String? get hoursPerDay => _hoursPerDay;
  String? get date => _date;
  int? get dayOfMonth => _dayOfMonth;
  String? get dayOfWeek => _dayOfWeek;
  int? get clockInStatus => _clockInStatus;
  int? get status => _status;
  bool? get isHoliday => _isHoliday;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['clock_in'] = _clockIn;
    map['clock_out'] = _clockOut;
    map['hours_per_day'] = _hoursPerDay;
    map['date'] = _date;
    map['day_of_month'] = _dayOfMonth;
    map['day_of_week'] = _dayOfWeek;
    map['clock_in_status'] = _clockInStatus;
    map['status'] = _status;
    map['is_holiday'] = _isHoliday;
    return map;
  }

}
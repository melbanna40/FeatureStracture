class AttendanceHistoryResponse {
  AttendanceHistoryResponse({
      int? code, 
      List<Data>? data, 
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
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
  }
  int? _code;
  List<Data>? _data;
  String? _message;

  int? get code => _code;
  List<Data>? get data => _data;
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

class Data {
  Data({
      int? id, 
      String? clockIn, 
      String? clockOut, 
      int? hoursPerDay,}){
    _id = id;
    _clockIn = clockIn;
    _clockOut = clockOut;
    _hoursPerDay = hoursPerDay;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _clockIn = json['clock_in'];
    _clockOut = json['clock_out'];
    _hoursPerDay = json['hours_per_day'];
  }
  int? _id;
  String? _clockIn;
  String? _clockOut;
  int? _hoursPerDay;

  int? get id => _id;
  String? get clockIn => _clockIn;
  String? get clockOut => _clockOut;
  int? get hoursPerDay => _hoursPerDay;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['clock_in'] = _clockIn;
    map['clock_out'] = _clockOut;
    map['hours_per_day'] = _hoursPerDay;
    return map;
  }

}
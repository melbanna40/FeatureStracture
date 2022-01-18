class HomeStatisticsResponse {
  HomeStatisticsResponse({
      int? code, 
      HomeStatisticsData? data,
      String? message,}){
    _code = code;
    _data = data;
    _message = message;
}

  HomeStatisticsResponse.fromJson(dynamic json) {
    _code = json['code'];
    _data = json['data'] != null ? HomeStatisticsData.fromJson(json['data']) : null;
    _message = json['message'];
  }
  int? _code;
  HomeStatisticsData? _data;
  String? _message;

  int? get code => _code;
  HomeStatisticsData? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

class HomeStatisticsData {
  HomeStatisticsData({
      int? id, 
      int? userId, 
      String? date, 
      String? clockIn, 
      String? clockOut,
    String? hoursPerDay,
      int? status, 
      int? workingFrom, 
      dynamic notes, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _date = date;
    _clockIn = clockIn;
    _clockOut = clockOut;
    _hoursPerDay = hoursPerDay;
    _status = status;
    _workingFrom = workingFrom;
    _notes = notes;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  HomeStatisticsData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _date = json['date'];
    _clockIn = json['clock_in'];
    _clockOut = json['clock_out'];
    _hoursPerDay = json['hours_per_day'];
    _status = json['status'];
    _workingFrom = json['working_from'];
    _notes = json['notes'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  int? _userId;
  String? _date;
  String? _clockIn;
  String? _clockOut;
  String? _hoursPerDay;
  int? _status;
  int? _workingFrom;
  dynamic _notes;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  int? get userId => _userId;
  String? get date => _date;
  String? get clockIn => _clockIn;
  String? get clockOut => _clockOut;
  String? get hoursPerDay => _hoursPerDay;
  int? get status => _status;
  int? get workingFrom => _workingFrom;
  dynamic get notes => _notes;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['date'] = _date;
    map['clock_in'] = _clockIn;
    map['clock_out'] = _clockOut;
    map['hours_per_day'] = _hoursPerDay;
    map['status'] = _status;
    map['working_from'] = _workingFrom;
    map['notes'] = _notes;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
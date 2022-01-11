class ApplyLeaveResponse {
  ApplyLeaveResponse({
      int? code, 
      ApplyLeaveData? data,
      String? message,}){
    _code = code;
    _data = data;
    _message = message;
}

  ApplyLeaveResponse.fromJson(dynamic json) {
    _code = json['code'];
    _data = json['data'] != null ? ApplyLeaveData.fromJson(json['data']) : null;
    _message = json['message'];
  }
  int? _code;
  ApplyLeaveData? _data;
  String? _message;

  int? get code => _code;
  ApplyLeaveData? get data => _data;
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

class ApplyLeaveData {
  ApplyLeaveData({
      String? from, 
      String? to, 
      int? userId, 
      dynamic reason, 
      int? leaveTypeId, 
      int? numberOfDayes, 
      String? updatedAt, 
      String? createdAt, 
      int? id,}){
    _from = from;
    _to = to;
    _userId = userId;
    _reason = reason;
    _leaveTypeId = leaveTypeId;
    _numberOfDayes = numberOfDayes;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  ApplyLeaveData.fromJson(dynamic json) {
    _from = json['from'];
    _to = json['to'];
    _userId = json['user_id'];
    _reason = json['reason'];
    _leaveTypeId = json['leave_type_id'];
    _numberOfDayes = json['number_of_dayes'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _from;
  String? _to;
  int? _userId;
  dynamic _reason;
  int? _leaveTypeId;
  int? _numberOfDayes;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  String? get from => _from;
  String? get to => _to;
  int? get userId => _userId;
  dynamic get reason => _reason;
  int? get leaveTypeId => _leaveTypeId;
  int? get numberOfDayes => _numberOfDayes;
  String? get updatedAt => _updatedAt;
  String? get createdAt => _createdAt;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['from'] = _from;
    map['to'] = _to;
    map['user_id'] = _userId;
    map['reason'] = _reason;
    map['leave_type_id'] = _leaveTypeId;
    map['number_of_dayes'] = _numberOfDayes;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}
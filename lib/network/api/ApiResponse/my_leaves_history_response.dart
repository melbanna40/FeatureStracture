class MyLeavesHistoryResponse {
  int? _code;
  List<MyLeavesHistoryData>? _data;
  String? _message;

  MyLeavesHistoryResponse({int? code, List<MyLeavesHistoryData>? data, String? message}) {
    if (code != null) {
      this._code = code;
    }
    if (data != null) {
      this._data = data;
    }
    if (message != null) {
      this._message = message;
    }
  }

  int? get code => _code;
  set code(int? code) => _code = code;
  List<MyLeavesHistoryData>? get data => _data;
  set data(List<MyLeavesHistoryData>? data) => _data = data;
  String? get message => _message;
  set message(String? message) => _message = message;

  MyLeavesHistoryResponse.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    if (json['data'] != null) {
      _data = <MyLeavesHistoryData>[];
      json['data'].forEach((v) {
        _data!.add(new MyLeavesHistoryData.fromJson(v));
      });
    }
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this._message;
    return data;
  }
}

class MyLeavesHistoryData {
  int? _id;
  int? _userId;
  int? _numberOfDayes;
  int? _leaveTypeId;
  String? _reason;
  String? _from;
  String? _to;
  int? _status;
  LeaveType? _leaveType;

  MyLeavesHistoryData(
      {int? id,
        int? userId,
        int? numberOfDayes,
        int? leaveTypeId,
        String? reason,
        String? from,
        String? to,
        int? status,
        LeaveType? leaveType}) {
    if (id != null) {
      this._id = id;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (numberOfDayes != null) {
      this._numberOfDayes = numberOfDayes;
    }
    if (leaveTypeId != null) {
      this._leaveTypeId = leaveTypeId;
    }
    if (reason != null) {
      this._reason = reason;
    }
    if (from != null) {
      this._from = from;
    }
    if (to != null) {
      this._to = to;
    }
    if (status != null) {
      this._status = status;
    }
    if (leaveType != null) {
      this._leaveType = leaveType;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  int? get numberOfDayes => _numberOfDayes;
  set numberOfDayes(int? numberOfDayes) => _numberOfDayes = numberOfDayes;
  int? get leaveTypeId => _leaveTypeId;
  set leaveTypeId(int? leaveTypeId) => _leaveTypeId = leaveTypeId;
  String? get reason => _reason;
  set reason(String? reason) => _reason = reason;
  String? get from => _from;
  set from(String? from) => _from = from;
  String? get to => _to;
  set to(String? to) => _to = to;
  int? get status => _status;
  set status(int? status) => _status = status;
  LeaveType? get leaveType => _leaveType;
  set leaveType(LeaveType? leaveType) => _leaveType = leaveType;

  MyLeavesHistoryData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _numberOfDayes = json['number_of_dayes'];
    _leaveTypeId = json['leave_type_id'];
    _reason = json['reason'];
    _from = json['from'];
    _to = json['to'];
    _status = json['status'];
    _leaveType = json['leave_type'] != null
        ? new LeaveType.fromJson(json['leave_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._userId;
    data['number_of_dayes'] = this._numberOfDayes;
    data['leave_type_id'] = this._leaveTypeId;
    data['reason'] = this._reason;
    data['from'] = this._from;
    data['to'] = this._to;
    data['status'] = this._status;
    if (this._leaveType != null) {
      data['leave_type'] = this._leaveType!.toJson();
    }
    return data;
  }
}

class LeaveType {
  int? _id;
  String? _name;
  String? _color;

  LeaveType({int? id, String? name, String? color}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (color != null) {
      this._color = color;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get color => _color;
  set color(String? color) => _color = color;

  LeaveType.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['color'] = this._color;
    return data;
  }
}

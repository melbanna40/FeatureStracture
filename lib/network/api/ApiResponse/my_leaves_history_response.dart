class MyLeavesHistoryResponse {
  MyLeavesHistoryResponse({
    required this.code,
    required this.data,
    required this.message,
  });
  late final int code;
  late final List<MyLeavesHistoryData> data;
  late final String message;

  MyLeavesHistoryResponse.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data = List.from(json['data']).map((e)=>MyLeavesHistoryData.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}

class MyLeavesHistoryData {
  MyLeavesHistoryData({
    required this.id,
    required this.userId,
    required this.numberOfDayes,
    required this.leaveTypeId,
    this.reason,
    required this.from,
    required this.to,
    required this.status,
    required this.leaveType,
  });
  late final int id;
  late final int userId;
  late final int numberOfDayes;
  late final int leaveTypeId;
  late final Null reason;
  late final String from;
  late final String to;
  late final String status;
  late final LeaveType leaveType;

  MyLeavesHistoryData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    numberOfDayes = json['number_of_dayes'];
    leaveTypeId = json['leave_type_id'];
    reason = null;
    from = json['from'];
    to = json['to'];
    status = json['status'];
    leaveType = LeaveType.fromJson(json['leave_type']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['number_of_dayes'] = numberOfDayes;
    _data['leave_type_id'] = leaveTypeId;
    _data['reason'] = reason;
    _data['from'] = from;
    _data['to'] = to;
    _data['status'] = status;
    _data['leave_type'] = leaveType.toJson();
    return _data;
  }
}

class LeaveType {
  LeaveType({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  LeaveType.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}
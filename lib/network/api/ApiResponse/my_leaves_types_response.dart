class MyLeavesTypesResponse {
  MyLeavesTypesResponse({
    required this.code,
    required this.data,
    required this.message,
  });
  late final int code;
  late final List<MyLeavesTypesData> data;
  late final String message;

  MyLeavesTypesResponse.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data = List.from(json['data']).map((e)=>MyLeavesTypesData.fromJson(e)).toList();
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

class MyLeavesTypesData {
  MyLeavesTypesData({
    required this.id,
    required this.leaveId,
    required this.numOfDays,
    required this.leaveType,
  });
  late final int id;
  late final int leaveId;
  late final int numOfDays;
  late final LeaveType leaveType;

  MyLeavesTypesData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    leaveId = json['leave_id'];
    numOfDays = json['num_of_days'];
    leaveType = LeaveType.fromJson(json['leave_type']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['leave_id'] = leaveId;
    _data['num_of_days'] = numOfDays;
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
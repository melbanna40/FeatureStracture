class MyLeavesBalanceResponse {
  MyLeavesBalanceResponse({
    required this.code,
    required this.data,
    required this.message,
  });
  late final int code;
  late final MyLeavesBalanceData data;
  late final String message;

  MyLeavesBalanceResponse.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data = MyLeavesBalanceData.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class MyLeavesBalanceData {
  MyLeavesBalanceData({
    required this.leavesType,
    required this.statisics,
  });
  late final List<LeavesType> leavesType;
  late final Statisics statisics;

  MyLeavesBalanceData.fromJson(Map<String, dynamic> json){
    leavesType = List.from(json['leaves_type']).map((e)=>LeavesType.fromJson(e)).toList();
    statisics = Statisics.fromJson(json['statisics']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['leaves_type'] = leavesType.map((e)=>e.toJson()).toList();
    _data['statisics'] = statisics.toJson();
    return _data;
  }
}

class LeavesType {
  LeavesType({
    required this.leaveId,
    required this.numOfDays,
    required this.leaveType,
  });
  late final int leaveId;
  late final int numOfDays;
  late final LeaveType leaveType;

  LeavesType.fromJson(Map<String, dynamic> json){
    leaveId = json['leave_id'];
    numOfDays = json['num_of_days'];
    leaveType = LeaveType.fromJson(json['leave_type']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
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
    required this.employeBalance,
  });
  late final int id;
  late final String name;
  late final int employeBalance;

  LeaveType.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    employeBalance = json['employe_balance'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['employe_balance'] = employeBalance;
    return _data;
  }
}

class Statisics {
  Statisics({
    required this.totalEmployeeLeaves,
    required this.totalBalance,
    required this.remaining,
  });
  late final int totalEmployeeLeaves;
  late final String totalBalance;
  late final int remaining;

  Statisics.fromJson(Map<String, dynamic> json){
    totalEmployeeLeaves = json['total_employee_leaves'];
    totalBalance = json['total_Balance'];
    remaining = json['remaining'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_employee_leaves'] = totalEmployeeLeaves;
    _data['total_Balance'] = totalBalance;
    _data['remaining'] = remaining;
    return _data;
  }
}
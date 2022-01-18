class MyLeavesBalanceResponse {
  final int? code;
  final MyLeavesBalanceData? data;
  final String? message;

  MyLeavesBalanceResponse({
    this.code,
    this.data,
    this.message,
  });

  MyLeavesBalanceResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        data = (json['data'] as Map<String,dynamic>?) != null ? MyLeavesBalanceData.fromJson(json['data'] as Map<String,dynamic>) : null,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'data' : data?.toJson(),
    'message' : message
  };
}

class MyLeavesBalanceData {
  final List<LeavesType>? leavesType;
  final Statisics? statisics;

  MyLeavesBalanceData({
    this.leavesType,
    this.statisics,
  });

  MyLeavesBalanceData.fromJson(Map<String, dynamic> json)
      : leavesType = (json['leaves_type'] as List?)?.map((dynamic e) => LeavesType.fromJson(e as Map<String,dynamic>)).toList(),
        statisics = (json['statisics'] as Map<String,dynamic>?) != null ? Statisics.fromJson(json['statisics'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'leaves_type' : leavesType?.map((e) => e.toJson()).toList(),
    'statisics' : statisics?.toJson()
  };
}

class LeavesType {
  final int? leaveId;
  final int? numOfDays;
  final LeaveType? leaveType;

  LeavesType({
    this.leaveId,
    this.numOfDays,
    this.leaveType,
  });

  LeavesType.fromJson(Map<String, dynamic> json)
      : leaveId = json['leave_id'] as int?,
        numOfDays = json['num_of_days'] as int?,
        leaveType = (json['leave_type'] as Map<String,dynamic>?) != null ? LeaveType.fromJson(json['leave_type'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'leave_id' : leaveId,
    'num_of_days' : numOfDays,
    'leave_type' : leaveType?.toJson()
  };
}

class LeaveType {
  final int? id;
  final String? name;
  final int? employeBalance;

  LeaveType({
    this.id,
    this.name,
    this.employeBalance,
  });

  LeaveType.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        employeBalance = json['employe_balance'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'employe_balance' : employeBalance
  };
}

class Statisics {
  final String? totalEmployeeLeaves;
  final String? totalBalance;
  final int? remaining;

  Statisics({
    this.totalEmployeeLeaves,
    this.totalBalance,
    this.remaining,
  });

  Statisics.fromJson(Map<String, dynamic> json)
      : totalEmployeeLeaves = json['total_employee_leaves'].toString(),
        totalBalance = json['total_Balance'].toString(),
        remaining = json['remaining'] as int?;

  Map<String, dynamic> toJson() => {
    'total_employee_leaves' : totalEmployeeLeaves,
    'total_Balance' : totalBalance,
    'remaining' : remaining
  };
}
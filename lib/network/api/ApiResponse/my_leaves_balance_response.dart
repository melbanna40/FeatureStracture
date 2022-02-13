class MyLeavesBalanceResponse {
  int? code;
  MyLeavesBalanceData? data;
  String? message;

  MyLeavesBalanceResponse({this.code, this.data, this.message});

  MyLeavesBalanceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null
        ? MyLeavesBalanceData.fromJson(json['data'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class MyLeavesBalanceData {
  List<LeavesType>? leavesType;
  Statisics? statisics;

  MyLeavesBalanceData({this.leavesType, this.statisics});

  MyLeavesBalanceData.fromJson(Map<String, dynamic> json) {
    if (json['leaves_type'] != null) {
      leavesType = <LeavesType>[];
      json['leaves_type'].forEach((v) {
        leavesType!.add(LeavesType.fromJson(v));
      });
    }
    statisics = json['statisics'] != null
        ? Statisics.fromJson(json['statisics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (leavesType != null) {
      data['leaves_type'] = leavesType!.map((v) => v.toJson()).toList();
    }
    if (statisics != null) {
      data['statisics'] = statisics!.toJson();
    }
    return data;
  }
}

class LeavesType {
  int? leaveId;
  int? numOfDays;
  LeaveType? leaveType;

  LeavesType({this.leaveId, this.numOfDays, this.leaveType});

  LeavesType.fromJson(Map<String, dynamic> json) {
    leaveId = json['leave_id'];
    numOfDays = json['num_of_days'];
    leaveType = json['leave_type'] != null
        ? LeaveType.fromJson(json['leave_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['leave_id'] = leaveId;
    data['num_of_days'] = numOfDays;
    if (leaveType != null) {
      data['leave_type'] = leaveType!.toJson();
    }
    return data;
  }
}

class LeaveType {
  int? id;
  String? name;
  String? color;
  String? totalBalance;
  String? employeBalance;
  String? numOfLeaveDays;
  String? percentage;

  LeaveType(
      {this.id,
      this.name,
      this.color,
      this.totalBalance,
      this.employeBalance,
      this.numOfLeaveDays,
      this.percentage});

  LeaveType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    totalBalance = json['total_balance'];
    employeBalance = json['employe_balance'];
    numOfLeaveDays = json['num_of_leave_days'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    data['total_balance'] = totalBalance;
    data['employe_balance'] = employeBalance;
    data['num_of_leave_days'] = numOfLeaveDays;
    data['percentage'] = percentage;
    return data;
  }
}

class Statisics {
  String? totalEmployeeLeaves;
  String? totalBalance;
  String? remaining;
  String? precentage;

  Statisics(
      {this.totalEmployeeLeaves,
      this.totalBalance,
      this.remaining,
      this.precentage});

  Statisics.fromJson(Map<String, dynamic> json) {
    totalEmployeeLeaves = json['total_employee_leaves'].toString();
    totalBalance = json['total_Balance'];
    remaining = json['remaining'];
    precentage = json['precentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_employee_leaves'] = totalEmployeeLeaves;
    data['total_Balance'] = totalBalance;
    data['remaining'] = remaining;
    data['precentage'] = precentage;
    return data;
  }
}

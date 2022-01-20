class MyLeavesBalanceResponse {
  int? code;
  MyLeavesBalanceData? data;
  String? message;

  MyLeavesBalanceResponse({this.code, this.data, this.message});

  MyLeavesBalanceResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new MyLeavesBalanceData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
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
        leavesType!.add(new LeavesType.fromJson(v));
      });
    }
    statisics = json['statisics'] != null
        ? new Statisics.fromJson(json['statisics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.leavesType != null) {
      data['leaves_type'] = this.leavesType!.map((v) => v.toJson()).toList();
    }
    if (this.statisics != null) {
      data['statisics'] = this.statisics!.toJson();
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
        ? new LeaveType.fromJson(json['leave_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leave_id'] = this.leaveId;
    data['num_of_days'] = this.numOfDays;
    if (this.leaveType != null) {
      data['leave_type'] = this.leaveType!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    data['total_balance'] = this.totalBalance;
    data['employe_balance'] = this.employeBalance;
    data['num_of_leave_days'] = this.numOfLeaveDays;
    data['percentage'] = this.percentage;
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
    totalEmployeeLeaves = json['total_employee_leaves'];
    totalBalance = json['total_Balance'];
    remaining = json['remaining'];
    precentage = json['precentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_employee_leaves'] = this.totalEmployeeLeaves;
    data['total_Balance'] = this.totalBalance;
    data['remaining'] = this.remaining;
    data['precentage'] = this.precentage;
    return data;
  }
}

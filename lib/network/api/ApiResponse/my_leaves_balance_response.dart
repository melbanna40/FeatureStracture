class MyLeavesBalanceResponse {
  int? _code;
  MyLeavesBalanceData? _data;
  String? _message;

  MyLeavesBalanceResponse({int? code, MyLeavesBalanceData? data, String? message}) {
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
  MyLeavesBalanceData? get data => _data;
  set data(MyLeavesBalanceData? data) => _data = data;
  String? get message => _message;
  set message(String? message) => _message = message;

  MyLeavesBalanceResponse.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _data = json['data'] != null ? new MyLeavesBalanceData.fromJson(json['data']) : null;
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    data['message'] = this._message;
    return data;
  }
}

class MyLeavesBalanceData {
  List<LeavesType>? _leavesType;
  Statisics? _statisics;

  MyLeavesBalanceData({List<LeavesType>? leavesType, Statisics? statisics}) {
    if (leavesType != null) {
      this._leavesType = leavesType;
    }
    if (statisics != null) {
      this._statisics = statisics;
    }
  }

  List<LeavesType>? get leavesType => _leavesType;
  set leavesType(List<LeavesType>? leavesType) => _leavesType = leavesType;
  Statisics? get statisics => _statisics;
  set statisics(Statisics? statisics) => _statisics = statisics;

  MyLeavesBalanceData.fromJson(Map<String, dynamic> json) {
    if (json['leaves_type'] != null) {
      _leavesType = <LeavesType>[];
      json['leaves_type'].forEach((v) {
        _leavesType!.add(new LeavesType.fromJson(v));
      });
    }
    _statisics = json['statisics'] != null
        ? new Statisics.fromJson(json['statisics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._leavesType != null) {
      data['leaves_type'] = this._leavesType!.map((v) => v.toJson()).toList();
    }
    if (this._statisics != null) {
      data['statisics'] = this._statisics!.toJson();
    }
    return data;
  }
}

class LeavesType {
  int? _leaveId;
  int? _numOfDays;
  LeaveType? _leaveType;

  LeavesType({int? leaveId, int? numOfDays, LeaveType? leaveType}) {
    if (leaveId != null) {
      this._leaveId = leaveId;
    }
    if (numOfDays != null) {
      this._numOfDays = numOfDays;
    }
    if (leaveType != null) {
      this._leaveType = leaveType;
    }
  }

  int? get leaveId => _leaveId;
  set leaveId(int? leaveId) => _leaveId = leaveId;
  int? get numOfDays => _numOfDays;
  set numOfDays(int? numOfDays) => _numOfDays = numOfDays;
  LeaveType? get leaveType => _leaveType;
  set leaveType(LeaveType? leaveType) => _leaveType = leaveType;

  LeavesType.fromJson(Map<String, dynamic> json) {
    _leaveId = json['leave_id'];
    _numOfDays = json['num_of_days'];
    _leaveType = json['leave_type'] != null
        ? new LeaveType.fromJson(json['leave_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leave_id'] = this._leaveId;
    data['num_of_days'] = this._numOfDays;
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
  int? _totalBalance;
  int? _employeBalance;
  int? _numOfLeaveDays;
  int? _percentage;

  LeaveType(
      {int? id,
        String? name,
        String? color,
        int? totalBalance,
        int? employeBalance,
        int? numOfLeaveDays,
        int? percentage}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (color != null) {
      this._color = color;
    }
    if (totalBalance != null) {
      this._totalBalance = totalBalance;
    }
    if (employeBalance != null) {
      this._employeBalance = employeBalance;
    }
    if (numOfLeaveDays != null) {
      this._numOfLeaveDays = numOfLeaveDays;
    }
    if (percentage != null) {
      this._percentage = percentage;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get color => _color;
  set color(String? color) => _color = color;
  int? get totalBalance => _totalBalance;
  set totalBalance(int? totalBalance) => _totalBalance = totalBalance;
  int? get employeBalance => _employeBalance;
  set employeBalance(int? employeBalance) => _employeBalance = employeBalance;
  int? get numOfLeaveDays => _numOfLeaveDays;
  set numOfLeaveDays(int? numOfLeaveDays) => _numOfLeaveDays = numOfLeaveDays;
  int? get percentage => _percentage;
  set percentage(int? percentage) => _percentage = percentage;

  LeaveType.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _color = json['color'];
    _totalBalance = json['total_balance'];
    _employeBalance = json['employe_balance'];
    _numOfLeaveDays = json['num_of_leave_days'];
    _percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['color'] = this._color;
    data['total_balance'] = this._totalBalance;
    data['employe_balance'] = this._employeBalance;
    data['num_of_leave_days'] = this._numOfLeaveDays;
    data['percentage'] = this._percentage;
    return data;
  }
}

class Statisics {
  int? _totalEmployeeLeaves;
  String? _totalBalance;
  int? _remaining;
  int? _precentage;

  Statisics(
      {int? totalEmployeeLeaves,
        String? totalBalance,
        int? remaining,
        int? precentage}) {
    if (totalEmployeeLeaves != null) {
      this._totalEmployeeLeaves = totalEmployeeLeaves;
    }
    if (totalBalance != null) {
      this._totalBalance = totalBalance;
    }
    if (remaining != null) {
      this._remaining = remaining;
    }
    if (precentage != null) {
      this._precentage = precentage;
    }
  }

  int? get totalEmployeeLeaves => _totalEmployeeLeaves;
  set totalEmployeeLeaves(int? totalEmployeeLeaves) =>
      _totalEmployeeLeaves = totalEmployeeLeaves;
  String? get totalBalance => _totalBalance;
  set totalBalance(String? totalBalance) => _totalBalance = totalBalance;
  int? get remaining => _remaining;
  set remaining(int? remaining) => _remaining = remaining;
  int? get precentage => _precentage;
  set precentage(int? precentage) => _precentage = precentage;

  Statisics.fromJson(Map<String, dynamic> json) {
    _totalEmployeeLeaves = json['total_employee_leaves'];
    _totalBalance = json['total_Balance'];
    _remaining = json['remaining'];
    _precentage = json['precentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_employee_leaves'] = this._totalEmployeeLeaves;
    data['total_Balance'] = this._totalBalance;
    data['remaining'] = this._remaining;
    data['precentage'] = this._precentage;
    return data;
  }
}

class MyLeavesHistoryResponse {
  final int? code;
  final List<MyLeavesHistoryData>? data;
  final String? message;

  MyLeavesHistoryResponse({
    this.code,
    this.data,
    this.message,
  });

  MyLeavesHistoryResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        data = (json['data'] as List?)?.map((dynamic e) => MyLeavesHistoryData.fromJson(e as Map<String,dynamic>)).toList(),
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'data' : data?.map((e) => e.toJson()).toList(),
    'message' : message
  };
}

class MyLeavesHistoryData {
  final int? id;
  final int? userId;
  final int? numberOfDayes;
  final int? leaveTypeId;
  final String? reason;
  final String? from;
  final String? to;
  final String? status;
  final LeaveType? leaveType;

  MyLeavesHistoryData({
    this.id,
    this.userId,
    this.numberOfDayes,
    this.leaveTypeId,
    this.reason,
    this.from,
    this.to,
    this.status,
    this.leaveType,
  });

  MyLeavesHistoryData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        numberOfDayes = json['number_of_dayes'] as int?,
        leaveTypeId = json['leave_type_id'] as int?,
        reason = json['reason'] as String?,
        from = json['from'] as String?,
        to = json['to'] as String?,
        status = json['status'] as String?,
        leaveType = (json['leave_type'] as Map<String,dynamic>?) != null ? LeaveType.fromJson(json['leave_type'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'user_id' : userId,
    'number_of_dayes' : numberOfDayes,
    'leave_type_id' : leaveTypeId,
    'reason' : reason,
    'from' : from,
    'to' : to,
    'status' : status,
    'leave_type' : leaveType?.toJson()
  };
}

class LeaveType {
  final int? id;
  final String? name;

  LeaveType({
    this.id,
    this.name,
  });

  LeaveType.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name
  };
}
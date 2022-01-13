class MyLeavesTypesResponse {
  final int? code;
  final List<MyLeavesTypesData>? data;
  final String? message;

  MyLeavesTypesResponse({
    this.code,
    this.data,
    this.message,
  });

  MyLeavesTypesResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        data = (json['data'] as List?)?.map((dynamic e) => MyLeavesTypesData.fromJson(e as Map<String,dynamic>)).toList(),
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'data' : data?.map((e) => e.toJson()).toList(),
    'message' : message
  };
}

class MyLeavesTypesData {
  final int? id;
  final int? leaveId;
  final int? numOfDays;
  final LeaveType? leaveType;

  MyLeavesTypesData({
    this.id,
    this.leaveId,
    this.numOfDays,
    this.leaveType,
  });

  MyLeavesTypesData.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        leaveId = json['leave_id'] as int?,
        numOfDays = json['num_of_days'] as int?,
        leaveType = (json['leave_type'] as Map<String,dynamic>?) != null ? LeaveType.fromJson(json['leave_type'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'leave_id' : leaveId,
    'num_of_days' : numOfDays,
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
class MyLeavesHistoryResponse {
  int? code;
  List<MyLeavesHistoryData>? data;
  String? message;

  MyLeavesHistoryResponse({this.code, this.data, this.message});

  MyLeavesHistoryResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <MyLeavesHistoryData>[];
      json['data'].forEach((v) {
        data!.add(MyLeavesHistoryData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class MyLeavesHistoryData {
  int? id;
  Details? details;

  MyLeavesHistoryData({this.id, this.details});

  MyLeavesHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    return data;
  }
}

class Details {
  String? from;
  String? to;
  int? numberOfDayes;
  LeaveType? leaveType;
  String? reason;
  dynamic comment;
  int? status;
  String? body;

  Details(
      {this.from,
      this.to,
      this.numberOfDayes,
      this.leaveType,
      this.reason,
      this.comment,
      this.status,
      this.body});

  Details.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    numberOfDayes = json['number_of_dayes'];
    leaveType = json['leave_type'] != null
        ? LeaveType.fromJson(json['leave_type'])
        : null;
    reason = json['reason'];
    comment = json['comment'];
    status = json['status'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['number_of_dayes'] = numberOfDayes;
    if (leaveType != null) {
      data['leave_type'] = leaveType!.toJson();
    }
    data['reason'] = reason;
    data['comment'] = comment;
    data['status'] = status;
    data['body'] = body;
    return data;
  }
}

class LeaveType {
  int? id;
  int? tenantId;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? color;

  LeaveType(
      {this.id,
      this.tenantId,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.color});

  LeaveType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tenant_id'] = tenantId;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['color'] = color;
    return data;
  }
}

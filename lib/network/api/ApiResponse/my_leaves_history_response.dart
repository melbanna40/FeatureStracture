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
        data!.add(new MyLeavesHistoryData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
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
    json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
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
  Null? comment;
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
        ? new LeaveType.fromJson(json['leave_type'])
        : null;
    reason = json['reason'];
    comment = json['comment'];
    status = json['status'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['to'] = this.to;
    data['number_of_dayes'] = this.numberOfDayes;
    if (this.leaveType != null) {
      data['leave_type'] = this.leaveType!.toJson();
    }
    data['reason'] = this.reason;
    data['comment'] = this.comment;
    data['status'] = this.status;
    data['body'] = this.body;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenant_id'] = this.tenantId;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['color'] = this.color;
    return data;
  }
}

class NotificationsResponse {
  int? code;
  List<NotificationData>? data;
  String? message;

  NotificationsResponse({this.code, this.data, this.message});

  NotificationsResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <NotificationData>[];
      json['data'].forEach((v) {
        data!.add(new NotificationData.fromJson(v));
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

class NotificationData {
  dynamic id;
  int? notifiableId;
  dynamic readAt;
  Details? details;

  NotificationData({this.id, this.notifiableId, this.readAt, this.details});

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notifiableId = json['notifiable_id'];
    readAt = json['read_at'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notifiable_id'] = this.notifiableId;
    data['read_at'] = this.readAt;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  dynamic from;
  dynamic to;
  dynamic numberOfDayes;
  LeaveType? leaveType;
  dynamic reason;
  String? comment;
  dynamic attachment;
  dynamic status;

  Details(
      {this.from,
      this.to,
      this.numberOfDayes,
      this.leaveType,
      this.reason,
      this.comment,
      this.attachment,
      this.status});

  Details.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    numberOfDayes = json['number_of_dayes'];
    leaveType = json['leave_type'] != null
        ? new LeaveType.fromJson(json['leave_type'])
        : null;
    reason = json['reason'];
    comment = json['comment'];
    attachment = json['attachment'];
    status = json['status'];
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
    data['attachment'] = this.attachment;
    data['status'] = this.status;
    return data;
  }
}

class LeaveType {
  dynamic id;
  dynamic tenantId;
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

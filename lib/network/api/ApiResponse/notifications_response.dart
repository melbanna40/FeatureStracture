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
        data!.add(NotificationData.fromJson(v));
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
        json['details'] != null ? Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['notifiable_id'] = notifiableId;
    data['read_at'] = readAt;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    return data;
  }
}

class Details {
  dynamic from;
  dynamic to;
  dynamic numberOfDays;
  LeaveType? leaveType;
  dynamic reason;
  String? comment;
  dynamic attachment;
  dynamic status;
  dynamic body;
  dynamic notificationStatus;

  Details(
      {this.from,
      this.to,
      this.numberOfDays,
      this.leaveType,
      this.reason,
      this.comment,
      this.attachment,
      this.status,
      this.body,
      this.notificationStatus});

  Details.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    numberOfDays = json['number_of_dayes'];
    leaveType = json['leave_type'] != null
        ? LeaveType.fromJson(json['leave_type'])
        : null;
    reason = json['reason'];
    comment = json['comment'];
    attachment = json['attachment'];
    status = json['status'];
    body = json['body'];
    notificationStatus = json['notification_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    data['number_of_dayes'] = numberOfDays;
    if (leaveType != null) {
      data['leave_type'] = leaveType!.toJson();
    }
    data['reason'] = reason;
    data['comment'] = comment;
    data['attachment'] = attachment;
    data['status'] = status;
    data['body'] = body;
    data['notification_status'] = notificationStatus;
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

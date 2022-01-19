class NotificationsResponse {
  NotificationsResponse({
    int? code,
    List<NotificationData>? data,
    String? message,
  }) {
    _code = code;
    _data = data;
    _message = message;
  }

  NotificationsResponse.fromJson(dynamic json) {
    _code = json['code'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(NotificationData.fromJson(v));
      });
    }
    _message = json['message'];
  }

  int? _code;
  List<NotificationData>? _data;
  String? _message;

  int? get code => _code;

  List<NotificationData>? get data => _data;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    return map;
  }
}

class NotificationData {
  NotificationData({
    String? id,
    Notification? notification,
    int? notifiableId,
    dynamic readAt,
  }) {
    _id = id;
    _notification = notification;
    _notifiableId = notifiableId;
    _readAt = readAt;
  }

  NotificationData.fromJson(dynamic json) {
    _id = json['id'];
    _notification = json['notification'] != null
        ? Notification.fromJson(json['notification'])
        : null;
    _notifiableId = json['notifiable_id'];
    _readAt = json['read_at'];
  }

  String? _id;
  Notification? _notification;
  int? _notifiableId;
  dynamic _readAt;

  String? get id => _id;

  Notification? get notification => _notification;

  int? get notifiableId => _notifiableId;

  dynamic get readAt => _readAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_notification != null) {
      map['notification'] = _notification?.toJson();
    }
    map['notifiable_id'] = _notifiableId;
    map['read_at'] = _readAt;
    return map;
  }
}

class Notification {
  Notification({
    String? title,
    String? body,
  }) {
    _title = title;
    _body = body;
  }

  Notification.fromJson(dynamic json) {
    _title = json['title'];
    _body = json['body'];
  }

  String? _title;
  String? _body;

  String? get title => _title;

  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }
}

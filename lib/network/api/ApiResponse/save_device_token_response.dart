class SaveDeviceTokenResponse {
  SaveDeviceTokenResponse({
      int? code, 
      Data? data, 
      String? message,}){
    _code = code;
    _data = data;
    _message = message;
}

  SaveDeviceTokenResponse.fromJson(dynamic json) {
    _code = json['code'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  int? _code;
  Data? _data;
  String? _message;

  int? get code => _code;
  Data? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

class Data {
  Data({
      int? id, 
      String? name, 
      String? phone, 
      int? tenantId, 
      String? email, 
      dynamic emailVerifiedAt, 
      String? deviceToken, 
      dynamic image, 
      int? loggedBefore, 
      String? type, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      String? macAddress,}){
    _id = id;
    _name = name;
    _phone = phone;
    _tenantId = tenantId;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _deviceToken = deviceToken;
    _image = image;
    _loggedBefore = loggedBefore;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _macAddress = macAddress;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _tenantId = json['tenant_id'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _deviceToken = json['device_token'];
    _image = json['image'];
    _loggedBefore = json['logged_before'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _macAddress = json['mac_address'];
  }
  int? _id;
  String? _name;
  String? _phone;
  int? _tenantId;
  String? _email;
  dynamic _emailVerifiedAt;
  String? _deviceToken;
  dynamic _image;
  int? _loggedBefore;
  String? _type;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  String? _macAddress;

  int? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  int? get tenantId => _tenantId;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get deviceToken => _deviceToken;
  dynamic get image => _image;
  int? get loggedBefore => _loggedBefore;
  String? get type => _type;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  String? get macAddress => _macAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['tenant_id'] = _tenantId;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['device_token'] = _deviceToken;
    map['image'] = _image;
    map['logged_before'] = _loggedBefore;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['mac_address'] = _macAddress;
    return map;
  }

}
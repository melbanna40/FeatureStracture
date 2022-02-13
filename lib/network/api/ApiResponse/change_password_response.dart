class ChangePasswordResponse {
  Data? data;
  int? code;
  String? message;

  ChangePasswordResponse({this.data, this.code, this.message});

  ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class Data {
  String? nextStep;
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  User? user;

  Data(
      {this.nextStep,
      this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    nextStep = json['next_step'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['next_step'] = nextStep;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  int? tenantId;
  String? email;
  dynamic emailVerifiedAt;
  dynamic deviceToken;
  dynamic image;
  int? loggedBefore;
  String? type;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? macAddress;

  User(
      {this.id,
      this.name,
      this.phone,
      this.tenantId,
      this.email,
      this.emailVerifiedAt,
      this.deviceToken,
      this.image,
      this.loggedBefore,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.macAddress});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    tenantId = json['tenant_id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    deviceToken = json['device_token'];
    image = json['image'];
    loggedBefore = json['logged_before'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    macAddress = json['mac_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['tenant_id'] = tenantId;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['device_token'] = deviceToken;
    data['image'] = image;
    data['logged_before'] = loggedBefore;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['mac_address'] = macAddress;
    return data;
  }
}

class ChangePasswordResponse {
  Data? data;
  int? code;
  String? message;

  ChangePasswordResponse({this.data, this.code, this.message});

  ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    data['message'] = this.message;
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next_step'] = this.nextStep;
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['tenant_id'] = this.tenantId;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['device_token'] = this.deviceToken;
    data['image'] = this.image;
    data['logged_before'] = this.loggedBefore;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['mac_address'] = this.macAddress;
    return data;
  }
}

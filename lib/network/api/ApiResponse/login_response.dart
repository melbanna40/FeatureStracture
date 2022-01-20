class LoginResponse {
  int? _code;
  UserDataModel? _data;
  String? _message;

  LoginResponse({int? code, UserDataModel? data, String? message}) {
    if (code != null) {
      this._code = code;
    }
    if (data != null) {
      this._data = data;
    }
    if (message != null) {
      this._message = message;
    }
  }

  int? get code => _code;
  set code(int? code) => _code = code;
  UserDataModel? get data => _data;
  set data(UserDataModel? data) => _data = data;
  String? get message => _message;
  set message(String? message) => _message = message;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _data = json['data'] != null ? new UserDataModel.fromJson(json['data']) : null;
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    data['message'] = this._message;
    return data;
  }
}

class UserDataModel {
  String? _accessToken;
  String? _tokenType;
  int? _expiresIn;
  User? _user;

  UserDataModel({String? accessToken, String? tokenType, int? expiresIn, User? user}) {
    if (accessToken != null) {
      this._accessToken = accessToken;
    }
    if (tokenType != null) {
      this._tokenType = tokenType;
    }
    if (expiresIn != null) {
      this._expiresIn = expiresIn;
    }
    if (user != null) {
      this._user = user;
    }
  }

  String? get accessToken => _accessToken;
  set accessToken(String? accessToken) => _accessToken = accessToken;
  String? get tokenType => _tokenType;
  set tokenType(String? tokenType) => _tokenType = tokenType;
  int? get expiresIn => _expiresIn;
  set expiresIn(int? expiresIn) => _expiresIn = expiresIn;
  User? get user => _user;
  set user(User? user) => _user = user;

  UserDataModel.fromJson(Map<String, dynamic> json) {
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this._accessToken;
    data['token_type'] = this._tokenType;
    data['expires_in'] = this._expiresIn;
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    return data;
  }
}

class User {
  int? _id;
  String? _name;
  String? _phone;
  int? _tenantId;
  String? _email;
  dynamic? _emailVerifiedAt;
  dynamic? _deviceToken;
  dynamic? _image;
  int? _loggedBefore;
  String? _type;
  String? _createdAt;
  String? _updatedAt;
  dynamic? _deletedAt;
  String? _macAddress;

  User(
      {int? id,
        String? name,
        String? phone,
        int? tenantId,
        String? email,
        dynamic? emailVerifiedAt,
        dynamic? deviceToken,
        dynamic? image,
        int? loggedBefore,
        String? type,
        String? createdAt,
        String? updatedAt,
        dynamic? deletedAt,
        String? macAddress}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (tenantId != null) {
      this._tenantId = tenantId;
    }
    if (email != null) {
      this._email = email;
    }
    if (emailVerifiedAt != null) {
      this._emailVerifiedAt = emailVerifiedAt;
    }
    if (deviceToken != null) {
      this._deviceToken = deviceToken;
    }
    if (image != null) {
      this._image = image;
    }
    if (loggedBefore != null) {
      this._loggedBefore = loggedBefore;
    }
    if (type != null) {
      this._type = type;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (deletedAt != null) {
      this._deletedAt = deletedAt;
    }
    if (macAddress != null) {
      this._macAddress = macAddress;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  int? get tenantId => _tenantId;
  set tenantId(int? tenantId) => _tenantId = tenantId;
  String? get email => _email;
  set email(String? email) => _email = email;
  dynamic? get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(dynamic? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  dynamic? get deviceToken => _deviceToken;
  set deviceToken(dynamic? deviceToken) => _deviceToken = deviceToken;
  dynamic? get image => _image;
  set image(dynamic? image) => _image = image;
  int? get loggedBefore => _loggedBefore;
  set loggedBefore(int? loggedBefore) => _loggedBefore = loggedBefore;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  dynamic? get deletedAt => _deletedAt;
  set deletedAt(dynamic? deletedAt) => _deletedAt = deletedAt;
  String? get macAddress => _macAddress;
  set macAddress(String? macAddress) => _macAddress = macAddress;

  User.fromJson(Map<dynamic, dynamic> json) {
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

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['phone'] = this._phone;
    data['tenant_id'] = this._tenantId;
    data['email'] = this._email;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['device_token'] = this._deviceToken;
    data['image'] = this._image;
    data['logged_before'] = this._loggedBefore;
    data['type'] = this._type;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['deleted_at'] = this._deletedAt;
    data['mac_address'] = this._macAddress;
    return data;
  }
}

class UserModel {
  User? data;
  String? message;
  int? status;

  UserModel({this.data, this.message, this.status});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new User.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? photo;
  String? image;
  String? avatar;
  int? isActive;
  dynamic username;
  String? email;
  dynamic headline;
  int? phone;
  int? city;
  int? country;
  dynamic about;
  dynamic shortDetails;
  int? languageId;
  String? languageCode;
  String? languageName;
  int? status;
  int? balance;
  int? currencyId;
  int? tenantId;
  int? languageRtl;
  String? token;

  User(
      {this.id,
      this.name,
      this.photo,
      this.image,
      this.avatar,
      this.isActive,
      this.username,
      this.email,
      this.headline,
      this.phone,
      this.city,
      this.country,
      this.about,
      this.shortDetails,
      this.languageId,
      this.languageCode,
      this.languageName,
      this.status,
      this.balance,
      this.currencyId,
      this.tenantId,
      this.languageRtl,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    image = json['image'];
    avatar = json['avatar'];
    isActive = json['is_active'];
    username = json['username'];
    email = json['email'];
    headline = json['headline'];
    phone = json['phone'];
    city = json['city'];
    country = json['country'];
    about = json['about'];
    shortDetails = json['short_details'];
    languageId = json['language_id'];
    languageCode = json['language_code'];
    languageName = json['language_name'];
    status = json['status'];
    balance = json['balance'];
    currencyId = json['currency_id'];
    tenantId = json['tenant_id'];
    languageRtl = json['language_rtl'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['image'] = this.image;
    data['avatar'] = this.avatar;
    data['is_active'] = this.isActive;
    data['username'] = this.username;
    data['email'] = this.email;
    data['headline'] = this.headline;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['country'] = this.country;
    data['about'] = this.about;
    data['short_details'] = this.shortDetails;
    data['language_id'] = this.languageId;
    data['language_code'] = this.languageCode;
    data['language_name'] = this.languageName;
    data['status'] = this.status;
    data['balance'] = this.balance;
    data['currency_id'] = this.currencyId;
    data['tenant_id'] = this.tenantId;
    data['language_rtl'] = this.languageRtl;
    data['token'] = this.token;
    return data;
  }
}

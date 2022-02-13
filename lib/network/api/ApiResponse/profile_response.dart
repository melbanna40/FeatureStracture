class ProfileResponse {
  int? code;
  ProfileData? data;
  String? message;

  ProfileResponse({this.code, this.data, this.message});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class ProfileData {
  String? empJobTitle;
  String? empDateOfJoin;
  String? empBranch;
  String? empDepartment;
  String? empJobType;
  String? companyName;
  String? userName;
  String? email;
  String? phone;
  String? image;

  ProfileData(
      {this.empJobTitle,
      this.empDateOfJoin,
      this.empBranch,
      this.empDepartment,
      this.empJobType,
      this.companyName,
      this.userName,
      this.email,
      this.phone,
      this.image});

  ProfileData.fromJson(Map<String, dynamic> json) {
    empJobTitle = json['empJobTitle'];
    empDateOfJoin = json['empDateOfJoin'];
    empBranch = json['empBranch'];
    empDepartment = json['empDepartment'];
    empJobType = json['empJobType'];
    companyName = json['companyName'];
    userName = json['userName'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empJobTitle'] = empJobTitle;
    data['empDateOfJoin'] = empDateOfJoin;
    data['empBranch'] = empBranch;
    data['empDepartment'] = empDepartment;
    data['empJobType'] = empJobType;
    data['companyName'] = companyName;
    data['userName'] = userName;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    return data;
  }
}

class ProfileResponse {
  int? code;
  ProfileData? data;
  String? message;

  ProfileResponse({this.code, this.data, this.message});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empJobTitle'] = this.empJobTitle;
    data['empDateOfJoin'] = this.empDateOfJoin;
    data['empBranch'] = this.empBranch;
    data['empDepartment'] = this.empDepartment;
    data['empJobType'] = this.empJobType;
    data['companyName'] = this.companyName;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    return data;
  }
}

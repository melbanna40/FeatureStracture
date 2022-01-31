class SalaryDetailsResponse {
  SalaryDetailsData? data;
  int? code;
  String? message;

  SalaryDetailsResponse({this.data, this.code, this.message});

  SalaryDetailsResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new SalaryDetailsData.fromJson(json['data'])
        : null;
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

class SalaryDetailsData {
  String? basicSalary;
  String? netSalary;
  String? bonusesSum;
  String? discountsSum;

  SalaryDetailsData(
      {this.basicSalary, this.netSalary, this.bonusesSum, this.discountsSum});

  SalaryDetailsData.fromJson(Map<String, dynamic> json) {
    basicSalary = json['basic_salary'].toString();
    netSalary = json['net_salary'].toString();
    bonusesSum = json['bonuses_sum'].toString();
    discountsSum = json['discounts_sum'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['basic_salary'] = this.basicSalary;
    data['net_salary'] = this.netSalary;
    data['bonuses_sum'] = this.bonusesSum;
    data['discounts_sum'] = this.discountsSum;
    return data;
  }
}

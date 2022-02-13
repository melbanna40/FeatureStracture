class SalaryDetailsResponse {
  SalaryDetailsData? data;
  int? code;
  String? message;

  SalaryDetailsResponse({this.data, this.code, this.message});

  SalaryDetailsResponse.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? SalaryDetailsData.fromJson(json['data']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['basic_salary'] = basicSalary;
    data['net_salary'] = netSalary;
    data['bonuses_sum'] = bonusesSum;
    data['discounts_sum'] = discountsSum;
    return data;
  }
}

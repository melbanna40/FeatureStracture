class MySalariesResponse {
  int? code;
  List<MySalariesData>? data;
  String? message;

  MySalariesResponse({this.code, this.data, this.message});

  MySalariesResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <MySalariesData>[];
      json['data'].forEach((v) {
        data!.add(new MySalariesData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class MySalariesData {
  int? id;
  int? value;
  String? note;
  String? month;
  String? createdAt;

  MySalariesData({this.id, this.value, this.note, this.month, this.createdAt});

  MySalariesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    note = json['note'];
    month = json['month'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['note'] = this.note;
    data['month'] = this.month;
    data['created_at'] = this.createdAt;
    return data;
  }
}

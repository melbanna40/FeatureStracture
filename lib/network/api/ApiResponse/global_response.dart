class GlobalResponse {
  GlobalResponse({
      int? code, 
      String? data, 
      String? message,}){
    _code = code;
    _data = data;
    _message = message;
}

  GlobalResponse.fromJson(dynamic json) {
    _code = json['code'];
    _data = json['data'];
    _message = json['message'];
  }
  int? _code;
  String? _data;
  String? _message;

  int? get code => _code;
  String? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['data'] = _data;
    map['message'] = _message;
    return map;
  }

}
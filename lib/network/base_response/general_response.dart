class GeneralResponse {
  GeneralResponse({
    dynamic code,
    dynamic data,
    dynamic message,
  }) {
    _code = code;
    _data = data;
    _message = message;
  }

  GeneralResponse.fromJson(dynamic json) {
    _code = json['code'];
    _data = json['data'];
    _message = json['message'];
  }
  dynamic _code;
  dynamic _data;
  dynamic _message;

  dynamic get code => _code;
  dynamic get data => _data;
  dynamic get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['data'] = _data;
    map['message'] = _message;
    return map;
  }
}

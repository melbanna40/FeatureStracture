class LoginResponse {
  LoginResponse({
      int? code, 
      Data? data, 
      String? message,}){
    _code = code;
    _data = data;
    _message = message;
}

  LoginResponse.fromJson(dynamic json) {
    _code = json['code'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
  }
  int? _code;
  Data? _data;
  String? _message;

  int? get code => _code;
  Data? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

class Data {
  Data({
      Original? original, 
      dynamic exception,}){
    _original = original;
    _exception = exception;
}

  Data.fromJson(dynamic json) {
    _original = json['original'] != null ? Original.fromJson(json['original']) : null;
    _exception = json['exception'];
  }
  Original? _original;
  dynamic _exception;

  Original? get original => _original;
  dynamic get exception => _exception;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_original != null) {
      map['original'] = _original?.toJson();
    }
    map['exception'] = _exception;
    return map;
  }

}

class Original {
  Original({
      String? accessToken, 
      String? tokenType, 
      int? expiresIn, 
      int? loggedBefore,}){
    _accessToken = accessToken;
    _tokenType = tokenType;
    _expiresIn = expiresIn;
    _loggedBefore = loggedBefore;
}

  Original.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _expiresIn = json['expires_in'];
    _loggedBefore = json['logged_before'];
  }
  String? _accessToken;
  String? _tokenType;
  int? _expiresIn;
  int? _loggedBefore;

  String? get accessToken => _accessToken;
  String? get tokenType => _tokenType;
  int? get expiresIn => _expiresIn;
  int? get loggedBefore => _loggedBefore;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['expires_in'] = _expiresIn;
    map['logged_before'] = _loggedBefore;
    return map;
  }

}
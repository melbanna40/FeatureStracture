class LoginResponse {
  LoginResponse({
    int? code,
    LoginData? data,
    String? message,
  }) {
    _code = code;
    _data = data;
    _message = message;
  }

  LoginResponse.fromJson(dynamic json) {
    _code = json['code'];
    _data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
    _message = json['message'];
  }

  int? _code;
  LoginData? _data;
  String? _message;

  int? get code => _code;

  LoginData? get data => _data;

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

class LoginData {
  LoginData({
    String? accessToken,
    String? tokenType,
    bool? loggedBefore,
    int? expiresIn,
  }) {
    _accessToken = accessToken;
    _tokenType = tokenType;
    _loggedBefore = loggedBefore;
    _expiresIn = expiresIn;
  }

  LoginData.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _tokenType = json['token_type'];
    _loggedBefore = json['logged_before'];
    _expiresIn = json['expires_in'];
  }

  String? _accessToken;
  String? _tokenType;
  bool? _loggedBefore;
  int? _expiresIn;

  String? get accessToken => _accessToken;

  String? get tokenType => _tokenType;

  bool? get loggedBefore => _loggedBefore;

  int? get expiresIn => _expiresIn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['token_type'] = _tokenType;
    map['logged_before'] = _loggedBefore;
    map['expires_in'] = _expiresIn;
    return map;
  }
}

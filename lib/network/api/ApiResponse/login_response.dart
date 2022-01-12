class LoginResponse {
  LoginResponse({
    required this.code,
    required this.data,
    required this.message,
  });
  late final int code;
  late final Data data;
  late final String message;

  LoginResponse.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data = Data.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data.toJson();
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.headers,
    required this.original,
    this.exception,
  });
  late final Headers headers;
  late final Original original;
  late final Null exception;

  Data.fromJson(Map<String, dynamic> json){
    headers = Headers.fromJson(json['headers']);
    original = Original.fromJson(json['original']);
    exception = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['headers'] = headers.toJson();
    _data['original'] = original.toJson();
    _data['exception'] = exception;
    return _data;
  }
}

class Headers {
  Headers();

  Headers.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
  }
}

class Original {
  Original({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.loggedBefore,
  });
  late final String accessToken;
  late final String tokenType;
  late final int expiresIn;
  late final int loggedBefore;

  Original.fromJson(Map<String, dynamic> json){
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    loggedBefore = json['logged_before'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['access_token'] = accessToken;
    _data['token_type'] = tokenType;
    _data['expires_in'] = expiresIn;
    _data['logged_before'] = loggedBefore;
    return _data;
  }
}
class LoginResponse {
  final int? code;
  final Data? data;
  final String? message;

  LoginResponse({
    this.code,
    this.data,
    this.message,
  });

  LoginResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'data' : data?.toJson(),
    'message' : message
  };
}

class Data {
  final Original? original;
  final dynamic exception;

  Data({
    this.original,
    this.exception,
  });

  Data.fromJson(Map<String, dynamic> json)
      : original = (json['original'] as Map<String,dynamic>?) != null ? Original.fromJson(json['original'] as Map<String,dynamic>) : null,
        exception = json['exception'];

  Map<String, dynamic> toJson() => {
    'original' : original?.toJson(),
    'exception' : exception
  };
}

class Original {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;
  final int? loggedBefore;

  Original({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.loggedBefore,
  });

  Original.fromJson(Map<String, dynamic> json)
      : accessToken = json['access_token'] as String?,
        tokenType = json['token_type'] as String?,
        expiresIn = json['expires_in'] as int?,
        loggedBefore = json['logged_before'] as int?;

  Map<String, dynamic> toJson() => {
    'access_token' : accessToken,
    'token_type' : tokenType,
    'expires_in' : expiresIn,
    'logged_before' : loggedBefore
  };
}
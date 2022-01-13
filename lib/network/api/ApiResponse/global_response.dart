class GlobalResponse {
  final int? code;
  final String? data;
  final String? message;

  GlobalResponse({
    this.code,
    this.data,
    this.message,
  });

  GlobalResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        data = json['data'] as String?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'data' : data,
    'message' : message
  };
}
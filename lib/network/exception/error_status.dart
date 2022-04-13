///Manage the status of error codes
class ErrorStatus {
  //Code of successful data
  // ignore: constant_identifier_names
  static const REQUEST_DATA_OK = 0;

  //The request is successful
  // ignore: constant_identifier_names
  static const int SUCCESS = 200;

  //The server access FORBIDDEN
  // ignore: constant_identifier_names
  static const int FORBIDDEN = 403;

  // ignore: constant_identifier_names
  static const int NOT_FOUND = 404;

  //Other errors
  // ignore: constant_identifier_names
  static const int UNKNOWN_ERROR = 1000;

  //network error
  // ignore: constant_identifier_names
  static const int NETWORK_ERROR = 1001;

  //Server connection error
  // ignore: constant_identifier_names
  static const int SOCKET_ERROR = 1002;

  //internal Server error
  // ignore: constant_identifier_names
  static const int SERVER_ERROR = 1003;

  //TIMEOUT_ERROR
  // ignore: constant_identifier_names
  static const int TIMEOUT_ERROR = 1004;

  //CANCEL_ERROR
  // ignore: constant_identifier_names
  static const int CANCEL_ERROR = 1005;

  //PARSE_ERROR
  // ignore: constant_identifier_names
  static const int PARSE_ERROR = 1006;
}

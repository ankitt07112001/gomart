// ignore: camel_case_types
class App_exception implements Exception {
  final _message;
  final _prefix;
  App_exception([this._message, this._prefix]);
  String toString() {
    return "$_message$_prefix";
  }
}

class FetchdataException extends App_exception {
  FetchdataException([String? message])
      : super(message, "Error During Commmunicaton");
}

class BadrequestException extends App_exception {
  BadrequestException([String? message]) : super(message, "Invalid request");
}

class UnauthorisedException extends App_exception {
  UnauthorisedException([String? message])
      : super(message, "Unauthorised request");
}

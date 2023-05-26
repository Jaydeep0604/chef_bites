import 'dart:core' as cr;

abstract class CBException {}

class NoRecordFoundException extends CBException {
  cr.String? message;
  cr.int? statusCode;
  NoRecordFoundException({this.message, this.statusCode = 404});
}

class UnAuthorizedException extends CBException {
  cr.String? message;
  cr.int statusCode;
  UnAuthorizedException({this.message, required this.statusCode});
}

class NoRegisteredException extends CBException {
  cr.String? message;
  cr.int statusCode;
  NoRegisteredException({this.message, required this.statusCode});
}

class Exception implements cr.Exception {
  final cr.String msg;
  const Exception(this.msg);
  cr.String toString() {
    return msg;
  }
}

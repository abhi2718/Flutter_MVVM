class AppException implements Exception {
  final String? message;
  final String? prefix;
  AppException({ this.message,  this.prefix});

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]):super(message:message,prefix:'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]):super(message:message,prefix:'Invalid request');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]):super(message:message,prefix:'Unauthorised request');
}

class InvalidException extends AppException {
  InvalidException([String? message]):super(message:message,prefix:'Invalid exception');
}

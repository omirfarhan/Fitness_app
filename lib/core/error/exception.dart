//Login method er jonne

//যখন email/password ভুল হবে।
class InvalidCredentialsException implements Exception {
  final String message;
  InvalidCredentialsException(this.message);
  @override
  String toString() => message;
}

//যদি backend আলাদা করে বলে user নেই।
class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException(this.message);
  @override
  String toString() => message;
}

//HTTP 403 Forbidden এর জন্য।
class ForbiddenException implements Exception {
  final String message;
  ForbiddenException(this.message);
  @override
  String toString() => message;
}


//Registration method er jonno exception class
class DuplicateEmailException implements Exception{

  final String message;
  DuplicateEmailException(this.message);

  @override
  String toString() => message;
}

class BadRequestException implements Exception {
  final String message;
  BadRequestException(this.message);

  @override
  String toString() => message;

}

class ServerRequestException implements Exception {
  final String message;
  ServerRequestException(this.message);

  @override
  String toString() => message;

}

class ServerException implements Exception {
  final String message;
  ServerException(this.message);

  @override
  String toString() => message;
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => message;
}

class GenericException implements Exception {
  final String message;
  GenericException(this.message);

  @override
  String toString() => message;
}
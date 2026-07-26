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
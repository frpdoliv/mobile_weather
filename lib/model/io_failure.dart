enum ErrorCode { noConnection, noResponse, badFormat }

class IOFailure implements Exception {
  final String message;
  final ErrorCode errorCode;

  const IOFailure({required this.message, required this.errorCode});

  @override
  String toString() => message;
}
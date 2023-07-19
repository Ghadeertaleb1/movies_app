import 'package:flutter_application_1/core/network/error.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

class OfflineException implements Exception {
  final ErrorModel errorModel;

  OfflineException({required this.errorModel});
}

import 'package:dio/dio.dart';

class WooException implements Exception {
  final String message;
  final int? statusCode;

  WooException(this.message, {this.statusCode});

  factory WooException.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return WooException('Connection timeout', statusCode: 408);
      case DioExceptionType.sendTimeout:
        return WooException('Send timeout', statusCode: 408);
      case DioExceptionType.receiveTimeout:
        return WooException('Receive timeout', statusCode: 408);
      case DioExceptionType.badResponse:
        return _handleResponseError(dioError);
      case DioExceptionType.cancel:
        return WooException('Request cancelled', statusCode: -1);
      case DioExceptionType.unknown:
      default:
        return WooException('Unknown error occurred', statusCode: 500);
    }
  }

  static WooException _handleResponseError(DioException dioError) {
    final statusCode = dioError.response?.statusCode;
    final data = dioError.response?.data;

    if (data is Map<String, dynamic>) {
      final message = data['message'] ?? 'An error occurred';
      return WooException(message, statusCode: statusCode);
    }

    return WooException(
      'Server responded with status code $statusCode',
      statusCode: statusCode,
    );
  }

  @override
  String toString() =>
      'WooException: $message${statusCode != null ? ' (status $statusCode)' : ''}';
}

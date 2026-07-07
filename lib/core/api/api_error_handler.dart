import 'package:dio/dio.dart';
import 'package:doc_doc/core/api/api_error_model.dart';

import 'failure.dart';

class ApiErrorHandler {
  static Failure handle(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return const Failure(message: 'Connection to server failed');

        case DioExceptionType.cancel:
          return const Failure(message: 'Request was cancelled');

        case DioExceptionType.connectionTimeout:
          return const Failure(message: 'Connection timeout');

        case DioExceptionType.receiveTimeout:
          return const Failure(message: 'Receive timeout');

        case DioExceptionType.sendTimeout:
          return const Failure(message: 'Send timeout');

        case DioExceptionType.badResponse:
          return _handleResponse(error.response);

        case DioExceptionType.unknown:
          return const Failure(
            message: 'Please check your internet connection.',
          );

        case DioExceptionType.badCertificate:
          return const Failure(message: 'Bad certificate.');
        case DioExceptionType.transformTimeout:
          return const Failure(message: 'Transform timeout.');
      }
    }

    return const Failure(message: 'Unexpected error occurred.');
  }

  static Failure _handleResponse(Response? response) {
    final data = response?.data;

    if (data is Map<String, dynamic>) {
      final apiError = ApiErrorModel.fromJson(data);

      return Failure(
        message: apiError.message ?? 'Unknown error',
        statusCode: apiError.code,
        errors: apiError.errors,
      );
    }

    return Failure(
      message: 'Unexpected server response',
      statusCode: response?.statusCode,
    );
  }
}

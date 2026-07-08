import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:doc_doc/core/helpers/constants.dart';
import 'package:doc_doc/core/helpers/shared_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Future<Dio> getDio() async {
    if (_dio != null) return _dio!;

    const timeout = Duration(seconds: 30);

    _dio = Dio(
      BaseOptions(
        connectTimeout: timeout,
        receiveTimeout: timeout,
      ),
    );

    await _addDefaultHeaders();
    _addDioInterceptor();

    return _dio!;
  }

  static Future<void> _addDefaultHeaders() async {
    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    _dio?.options.headers = {
      'Accept': 'application/json',
      if (token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    _dio?.options.headers['Authorization'] = 'Bearer $token';
  }

  static void clearToken() {
    _dio?.options.headers.remove('Authorization');
  }

  static void _addDioInterceptor() {
    if (!kDebugMode) return;

    _dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }
}
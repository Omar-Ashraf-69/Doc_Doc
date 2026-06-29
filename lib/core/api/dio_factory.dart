import 'package:dio/dio.dart';
import 'package:doc_doc/core/helpers/constants.dart';
import 'package:doc_doc/core/helpers/shared_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    _dio ??= Dio(BaseOptions(connectTimeout: timeOut, receiveTimeout: timeOut));
    addDioHeaders();
    addDioInterceptor();
    return _dio!;
  }

  static void addDioHeaders() async {
    _dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    _dio?.options.headers = {'Authorization': 'Bearer $token'};
  }

  static void addDioInterceptor() {
    _dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}

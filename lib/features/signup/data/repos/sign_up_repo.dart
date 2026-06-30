

import 'package:doc_doc/core/api/api_error_handler.dart';
import 'package:doc_doc/core/api/api_result.dart';
import 'package:doc_doc/core/api/api_service.dart';
import 'package:doc_doc/features/signup/data/models/sign_up_request_body.dart';
import 'package:doc_doc/features/signup/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiService _apiService;
  SignUpRepo({ required this._apiService});
  


  Future<ApiResult<SignupResponse>> register(SignupRequestBody signupRequestBody) async{
    try {
      final response = await _apiService.register(signupRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(ApiErrorHandler.handle(e).message!);
    }
  }
}
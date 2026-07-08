import 'package:doc_doc/core/api/api_error_handler.dart';
import 'package:doc_doc/core/api/api_result.dart';
import 'package:doc_doc/core/api/api_service.dart';
import 'package:doc_doc/features/login/data/models/login_request_model.dart';
import 'package:doc_doc/features/login/data/models/login_response_model.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo({ required this._apiService});

  Future<ApiResult<LoginResponseModel>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      final response = await _apiService.login(loginRequestModel);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}

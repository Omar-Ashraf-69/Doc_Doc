import 'package:dio/dio.dart';
import 'package:doc_doc/core/api/api_cons.dart';
import 'package:doc_doc/features/login/data/models/login_request_model.dart';
import 'package:doc_doc/features/login/data/models/login_response_model.dart';
import 'package:doc_doc/features/signup/data/models/sign_up_request_body.dart';
import 'package:doc_doc/features/signup/data/models/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestModel loginRequestModel);

  @POST(ApiConstants.register)
  Future<SignupResponse> register(@Body() SignupRequestBody signupRequestBody);
}

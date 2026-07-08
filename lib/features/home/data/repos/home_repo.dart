import 'package:doc_doc/core/api/api_error_handler.dart';
import 'package:doc_doc/core/api/api_result.dart';
import 'package:doc_doc/core/api/api_service.dart';
import 'package:doc_doc/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo({required this.apiService});

  Future<ApiResult<SpecializationsResponseModel>> fetchDoctors() async {
    try {
      final response = await apiService.fetchData();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}

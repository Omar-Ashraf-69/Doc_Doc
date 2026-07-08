import 'package:doc_doc/core/api/api_result.dart' hide Success;
import 'package:doc_doc/core/helpers/extensions.dart';
import 'package:doc_doc/features/home/data/models/specializations_response_model.dart';
import 'package:doc_doc/features/home/data/repos/home_repo.dart';
import 'package:doc_doc/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState<SpecializationsResponseModel>> {
  HomeCubit({required this.repo}) : super(const Idle());
  final HomeRepo repo;
  List<SpecializationsData?>? specializationsList = [];

  void fetchDoctors() async {
    emit(Loading());
    final response = await repo.fetchDoctors();

    response.when(
      success: (data) {
        specializationsList = data.specializationDataList;
        emit(Success(data));
      },
      failure: (failure) {
        emit(Failure(failure.message));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList = getDoctorsListBySpecializationId(
      specializationId,
    );
    if (!doctorsList.isNullOrEmpty) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(const HomeState.doctorsError());
    }
  }

  List<Doctors?>? getDoctorsListBySpecializationId(int? specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}

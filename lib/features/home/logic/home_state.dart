import 'package:doc_doc/features/home/data/models/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.idle() = Idle<T>;
  const factory HomeState.loading() = Loading<T>;
  const factory HomeState.success(T data) = Success<T>;
  const factory HomeState.error(String message) = Failure<T>;

  // Doctors
  const factory HomeState.doctorsSuccess(List<Doctors?>? doctorsList) = DoctorsSuccess;
  const factory HomeState.doctorsError() =
      DoctorsError;
}
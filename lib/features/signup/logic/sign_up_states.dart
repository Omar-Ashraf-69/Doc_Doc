import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_states.freezed.dart';
@freezed
class SignUpStates<T> with _$SignUpStates<T> {
  const factory SignUpStates.idle() = Idle<T>;
  const factory SignUpStates.loading() = Loading<T>;
  const factory SignUpStates.success(T data) = Success<T>;
  const factory SignUpStates.error(String message) = Failure<T>;
}
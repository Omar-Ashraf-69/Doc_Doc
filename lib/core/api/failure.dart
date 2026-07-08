

import 'package:json_annotation/json_annotation.dart';

part 'failure.g.dart';

@JsonSerializable()

class Failure {
  final String message;
  final int? statusCode;
  @JsonKey(name: 'data')
  final dynamic errors;

  const Failure({
    required this.message,
    this.statusCode,
    this.errors,
  });
  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);
  Map<String, dynamic> toJson() => _$FailureToJson(this);
}
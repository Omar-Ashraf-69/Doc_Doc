// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Failure _$FailureFromJson(Map<String, dynamic> json) => Failure(
  message: json['message'] as String,
  statusCode: (json['statusCode'] as num?)?.toInt(),
  errors: json['data'],
);

Map<String, dynamic> _$FailureToJson(Failure instance) => <String, dynamic>{
  'message': instance.message,
  'statusCode': instance.statusCode,
  'data': instance.errors,
};

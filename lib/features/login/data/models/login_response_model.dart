import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String? message;
  @JsonKey(name: 'data')
  final UserData? userData;
  final bool? status;
  @JsonKey(name: 'code')
  final int? statusCode;

  LoginResponseModel({
    required this.message,
    required this.userData,
    required this.status,
    required this.statusCode,
  });
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: 'username')
  final String? userName;
  final String? token;

  UserData({required this.userName, required this.token});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

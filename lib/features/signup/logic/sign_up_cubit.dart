import 'package:doc_doc/core/api/api_result.dart' hide Success;
import 'package:doc_doc/features/signup/data/models/sign_up_request_body.dart';
import 'package:doc_doc/features/signup/data/models/sign_up_response.dart';
import 'package:doc_doc/features/signup/data/repos/sign_up_repo.dart';
import 'package:doc_doc/features/signup/logic/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates<SignupResponse>> {
  SignUpCubit({required this.repo}) : super(Idle());
  final SignUpRepo repo;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void register() async{
    emit(Loading());
    final response = await repo.register(SignupRequestBody(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      gender: 0,
      passwordConfirmation: confirmPasswordController.text,
      phone: phoneController.text,
    ));

    response.when(
      success: (data) async{
        //await saveUserToken(data.userData?.token ?? '');
        emit(Success(data));
      },
      error: (message) {
        emit(Failure(message));
      },
    );
  }
  
}

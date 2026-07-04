import 'package:doc_doc/core/api/api_result.dart' hide Success;
import 'package:doc_doc/core/funcs/save_user_token.dart';
import 'package:doc_doc/features/login/data/models/login_request_model.dart';
import 'package:doc_doc/features/login/data/models/login_response_model.dart';
import 'package:doc_doc/features/login/data/repos/login_repo.dart';
import 'package:doc_doc/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState<LoginResponseModel>> {
  LoginCubit({required this.repo}) : super(Idle());
  final LoginRepo repo;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login() async {
    emit(Loading());
    final response = await repo.login(
      LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (data) async {
        await saveUserToken(data.userData?.token ?? '');
        emit(Success(data));
      },
      error: (message) {
        emit(Failure(message));
      },
    );
  }

  
}

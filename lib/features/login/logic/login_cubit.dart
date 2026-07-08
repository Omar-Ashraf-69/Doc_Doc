import 'package:doc_doc/core/api/api_result.dart';
import 'package:doc_doc/core/funcs/save_user_token.dart';
import 'package:doc_doc/features/login/data/models/login_request_model.dart';
import 'package:doc_doc/features/login/data/models/login_response_model.dart';
import 'package:doc_doc/features/login/data/repos/login_repo.dart';
import 'package:doc_doc/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState<LoginResponseModel>> {
  LoginCubit({required this._repo})
    : super(const LoginState.idle());

  final LoginRepo _repo;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(const LoginState.loading());

    final response = await _repo.login(
      LoginRequestModel(
        email: emailController.text.trim(),
        password: passwordController.text,
      ),
    );

    response.when(
      success: (data) async {
        await saveUserToken(data.userData?.token ?? '');

        emit(LoginState.success(data));
      },
      failure: (failure) {
        emit(LoginState.error(failure.message));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();

    return super.close();
  }
}

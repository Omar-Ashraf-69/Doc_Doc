import 'package:doc_doc/core/funcs/setup_error_state.dart';
import 'package:doc_doc/core/helpers/extensions.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/features/signup/data/models/sign_up_response.dart';
import 'package:doc_doc/features/signup/logic/sign_up_cubit.dart';
import 'package:doc_doc/features/signup/logic/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListner extends StatelessWidget {
  const SignUpBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpStates<SignupResponse>>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: ColorsManager.mainBlue),
              ),
            );
          },
          success: (signUp) {
            setupSignUpSuccessState(context, signUp);
            // context.pop();
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }

  Future<dynamic> setupSignUpSuccessState(BuildContext context, SignupResponse signUp) {
    return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              icon: const Icon(
                Icons.done_outline_rounded,
                color: Colors.green,
                size: 32,
              ),
              content: Text(
                "Welcome ${signUp.userData!.userName}",
                style: TextStyles.font15DarkBlueMedium,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                    context.pushReplacementNamed(Routes.login);
                  },
                  child: Text(
                    'Sing In Now',
                    style: TextStyles.font14BlueSemiBold,
                  ),
                ),
              ],
            ),
          );
  }
}

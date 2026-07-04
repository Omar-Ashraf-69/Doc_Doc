import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/core/widgets/app_text_button.dart';
import 'package:doc_doc/features/login/views/widgets/terms_and_conditions_text.dart';
import 'package:doc_doc/features/signup/logic/sign_up_cubit.dart';
import 'package:doc_doc/features/signup/views/widgets/have_an_account.dart';
import 'package:doc_doc/features/signup/views/widgets/sign_up_bloc_listner.dart';
import 'package:doc_doc/features/signup/views/widgets/sign_up_form_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create Account", style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  'Sign up now to get started. We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(20),
                Column(
                  children: [
                    SingUpFormSection(),
                    verticalSpace(24),
                    AppTextButton(
                      buttonText: "Signup",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSingUp(context);
                      },
                    ),
                    verticalSpace(16),
                    TermsAndConditionsText(),
                    verticalSpace(20),
                    HaveAnAccount(),
                    SignUpBlocListner(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSingUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().register();
    }
  }
}

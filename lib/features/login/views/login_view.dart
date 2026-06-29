import 'package:doc_doc/core/helpers/extensions.dart';
import 'package:doc_doc/core/helpers/spacing.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:doc_doc/core/widgets/app_text_button.dart';
import 'package:doc_doc/features/login/views/widgets/dont_have_account_text.dart';
import 'package:doc_doc/features/login/views/widgets/email_and_password.dart';
import 'package:doc_doc/features/login/views/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final formkey = GlobalKey<FormState>();
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
                Text("Welcome Back", style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Form(
                  child: Column(
                    children: [
                      EmailAndPassword(formKey: formkey),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalSpace(40),
                      AppTextButton(
                        buttonText: "Login",
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () {
                          validateThenDoLogin(context);
                        },
                      ),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(60),
                      const DontHaveAccountText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (formkey.currentState!.validate()) {
      // do login
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(Icons.fork_right, color: Colors.red, size: 32),
            content: Text(
              "Login Done",
              textAlign: TextAlign.center,
              style: TextStyles.font15DarkBlueMedium,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Got it', style: TextStyles.font14BlueSemiBold),
              ),
            ],
          );
        },
      );
    }
  }
}

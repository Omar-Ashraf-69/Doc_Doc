import 'package:doc_doc/core/helpers/constants.dart';
import 'package:doc_doc/core/helpers/extensions.dart';
import 'package:doc_doc/core/helpers/shared_pref_helper.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:doc_doc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        SharedPrefHelper.setData(SharedPrefKeys.isFirstTime, true);
        context.pushReplacementNamed(Routes.login);
        // Navigator.pushReplacementNamed(context, '/login');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.mainBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 15.h),
      ),
      child: Center(
        child: Text('Get Started', style: TextStyles.font18WhiteMedium),
      ),
    );
  }
}

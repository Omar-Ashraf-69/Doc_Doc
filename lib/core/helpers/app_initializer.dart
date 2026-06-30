import 'package:doc_doc/core/di/dependecny_injection.dart';
import 'package:doc_doc/core/helpers/constants.dart';
import 'package:doc_doc/core/helpers/shared_pref_helper.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:flutter/material.dart';

class AppInitializer {
  Future<String> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await setupGetIt();

    return await _getInitialRoute();
  }

  Future<String> _getInitialRoute() async {
    final token = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userToken,
    );

    if (token.isNotEmpty == true) {
      return Routes.home;
    }

    final onboardingCompleted =
        await SharedPrefHelper.getBool(
          SharedPrefKeys.isFirstTime,
        );

    if (onboardingCompleted) {
      return Routes.login;
    }

    return Routes.onBoarding;
  }
}
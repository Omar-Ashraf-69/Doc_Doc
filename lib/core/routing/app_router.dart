import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/features/on_boarding/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String initialRoute = Routes.onBoarding;
  Route? generateRoute(RouteSettings settings) {
    //final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      default:
        return null;
    }
  }
}

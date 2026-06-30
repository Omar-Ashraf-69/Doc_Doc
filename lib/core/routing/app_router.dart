import 'package:doc_doc/core/di/dependecny_injection.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/features/home/views/home_view.dart';
import 'package:doc_doc/features/login/logic/login_cubit.dart';
import 'package:doc_doc/features/login/views/login_view.dart';
import 'package:doc_doc/features/on_boarding/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const String initialRoute = Routes.onBoarding;
  Route? generateRoute(RouteSettings settings) {
    //final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginView(),
          ),
        );

      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      default:
        return null;
    }
  }
}

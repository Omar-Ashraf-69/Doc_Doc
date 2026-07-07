import 'package:doc_doc/core/di/dependecny_injection.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/features/home/views/home_view.dart';
import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/login/logic/login_cubit.dart';
import 'package:doc_doc/features/login/views/login_view.dart';
import 'package:doc_doc/features/on_boarding/views/on_boarding_view.dart';
import 'package:doc_doc/features/signup/logic/sign_up_cubit.dart';
import 'package:doc_doc/features/signup/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoarding:
        return _buildRoute(const OnBoardingView());
      case Routes.login:
        return _buildRoute(
          BlocProvider(create: (_) => getIt<LoginCubit>(), child: const LoginView()),
        );

      case Routes.signUp:
        return _buildRoute(
          BlocProvider(
            create: (_) => getIt<SignUpCubit>(),
            child:const SignUpView(),
          ),
        );
      case Routes.home:
        return _buildRoute(
          BlocProvider(
            lazy: false,
            create: (_) => getIt<HomeCubit>()..fetchDoctors(),
            child: const HomeView(),
          ),
        );
      default:
        return _buildRoute(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  Route<dynamic> _buildRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}

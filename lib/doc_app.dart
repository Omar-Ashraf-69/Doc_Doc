import 'package:doc_doc/core/routing/app_router.dart';
import 'package:doc_doc/core/routing/routes.dart';
import 'package:doc_doc/core/theming/colors.dart';
import 'package:flutter/material.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key, required this._appRouter});
  final AppRouter _appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doc Demo',
      theme: ThemeData(
        primaryColor: ColorsManager.mainBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Routes.onBoarding,
      onGenerateRoute: _appRouter.generateRoute,
    );
  }
}

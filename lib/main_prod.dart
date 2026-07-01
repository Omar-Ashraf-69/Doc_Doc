import 'package:doc_doc/core/helpers/app_initializer.dart';
import 'package:doc_doc/core/routing/app_router.dart';
import 'package:doc_doc/doc_app.dart';
import 'package:flutter/material.dart';

void main() async {
  final initializer = AppInitializer();
  final initialRoute = await initializer.initialize();
  
  runApp(DocApp(appRouter: AppRouter(), initialRoute: initialRoute));
}

import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_router.dart';

import 'core/utils/colors_manager.dart';
import 'core/utils/di.dart';

void main() async {
  await initAppModule();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorsManager.primary,
        textTheme: ThemeData.dark().textTheme,
      ),
    );
  }
}

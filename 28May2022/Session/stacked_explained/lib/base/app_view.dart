import 'package:flutter/material.dart';
import 'package:stacked_explained/views/splash/splash_view.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app_setup.router.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        home: const SplashView());
  }
}

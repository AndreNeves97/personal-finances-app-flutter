import 'package:financefy_app/app/modules/core/presenter/styles/app_themes.dart';
import 'package:financefy_app/app/modules/core/presenter/utils/app_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Slidy',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      scrollBehavior: AppScrollBehavior(),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

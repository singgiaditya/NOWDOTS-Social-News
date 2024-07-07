import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/routes/route.dart';
import 'package:nowdots_social_news/src/config/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nowdots Social News',
      theme: appTheme(),
      themeMode: ThemeMode.light,
      routerConfig: AppRoute.router,
    );
  }
}

import 'package:currency_app/presentation/utilities/resources/routes_manager.dart';
import 'package:currency_app/presentation/utilities/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
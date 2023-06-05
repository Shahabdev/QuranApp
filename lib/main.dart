import 'package:flutter/material.dart';
import 'package:quranproject/utils/routes/routes_name.dart';
import 'package:quranproject/utils/routes/routes_switching.dart';
import 'package:quranproject/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute:Routes.generateRoutes,
      );

  }
}


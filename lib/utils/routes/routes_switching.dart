import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quranproject/utils/routes/routes_name.dart';
import 'package:quranproject/view/home_screen.dart';
import 'package:quranproject/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>const SplashScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (BuildContext context)=>HomeScreen());
      default:
        return MaterialPageRoute(builder: (BuildContext context)=>
          Scaffold(
            body:Text('no page found')
          )
        );
    }
  }
}

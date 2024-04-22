import 'package:bmi_tracker/view/pages/auth/auth_page.dart';
import 'package:bmi_tracker/view/pages/home.dart';
import 'package:bmi_tracker/view/pages/splash.dart';
import 'package:flutter/material.dart';

class GenerateRouter {
  GenerateRouter._();

  static const String splash = '/';
  static const String home = '/home';
  static const String auth = '/auth';

  static String activeRoute = '/';

  static Route routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        {
          activeRoute = splash;
          return MaterialPageRoute(
            builder: (context) => const Splash(),
          );
        }
      case auth:
        {
          activeRoute = auth;
          return MaterialPageRoute(
            builder: (context) => const AuthPage(),
          );
        }
      case home:
        {
          activeRoute = home;
          return MaterialPageRoute(
            builder: (context) => const Home(),
          );
        }

      default:
        {
          return MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text('Page not found!'),
              ),
            ),
          );
        }
    }
  }
}

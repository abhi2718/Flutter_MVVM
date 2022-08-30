import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_screen.dart';
import 'package:mvvm/view/signup_screen.dart';
class Routes  {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: ((context) => const HomeScreen()));
      case RouteName.login:
        return MaterialPageRoute(builder: ((context) => const LogInScreen()));
      case RouteName.register:
        return MaterialPageRoute(builder: ((context) => const SignupScreen()));
      default:
        return MaterialPageRoute(builder: ((_) {
          return const Scaffold(
            body: Center(
              child: Text("No routes found "),
            ),
          );
        }));
    }
  }
}

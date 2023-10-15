import 'package:app/utils/app.dart';
import 'package:app/view/black_jack/play_screen/play_screen.dart';
import 'package:app/view/black_jack/start_screen/start_screen.dart';
import 'package:app/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings routes) {
    switch (routes.name) {
      case EndPoints.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case EndPoints.home:
        return noAnimation(
          const StartScreen(),
        );
      case EndPoints.blackjack:
        return noAnimation(
          const PlayScreen(),
        );
      default:
    }
    return null;
  }

  static PageRouteBuilder noAnimation(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return page;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return child;
      },
    );
  }
}

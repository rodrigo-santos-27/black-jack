import 'package:app/model_view/home_view_model.dart';
import 'package:app/utils/app.dart';
import 'package:app/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings routes) {
    switch (routes.name) {
      // case EndPoints.splashScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => MultiProvider(
      //       providers: [
      //         ChangeNotifierProvider(create: (_) => SplashScreenViewModel())
      //       ],
      //       child: const SplashScreen(),
      //     ),
      //   );
      case EndPoints.home:
        return MaterialPageRoute(
          builder: (_) => MultiProvider(
            providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
            child: const HomeScreen(),
          ),
        );
      default:
    }
    return null;
  }
}

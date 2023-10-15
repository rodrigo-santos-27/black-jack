import 'package:app/model_view/black_jack_view_model.dart';
import 'package:app/model_view/splash_screen_view_model.dart';
import 'package:app/model_view/start_view_model.dart';
import 'package:app/routes/routes.dart';
import 'package:app/utils/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(DevicePreview(
  //     builder: (context) => const BlackJack())); // Turn on to see many resolution
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SplashScreenViewModel()),
      ChangeNotifierProvider(create: (_) => StartViewModel()),
      ChangeNotifierProvider(create: (_) => BlackjackViewModel())
    ],
    child: const BlackJack(),
  ));
}

class BlackJack extends StatelessWidget {
  const BlackJack({super.key});

  @override
  Widget build(BuildContext context) {
    App app = App();
    SystemUiOverlayStyle statusBarStyle = SystemUiOverlayStyle.light.copyWith(
        statusBarColor: app.colors.primaryColorApp,
        statusBarIconBrightness: Brightness.light);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: statusBarStyle,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: app.labels.appName,
        theme: ThemeData(
          textTheme: GoogleFonts.kalamTextTheme(),
          primaryTextTheme: GoogleFonts.kalamTextTheme(),
          appBarTheme: AppBarTheme(color: app.colors.primaryColorApp),
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: app.colors.primaryColorApp,
                secondary: app.colors.primaryColorApp,
              ),
        ),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: app.initRoute,
      ),
    );
  }
}

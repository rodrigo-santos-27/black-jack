import 'package:app/model_view/splash_screen_view_model.dart';
import 'package:app/utils/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SplashScreenViewModel>(context, listen: false).runSimulator();
  }

  @override
  Widget build(BuildContext context) {
    App app = App();
    final double widthWidget = MediaQuery.of(context).size.width;
    final double heightWidget = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: app.colors.primaryColorApp,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(app.assetsPath.splashScreen),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: widthWidget * 0.3,
                child: Image.asset(app.assetsPath.logo),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: heightWidget * 0.15,
                width: widthWidget * 0.2,
                child: Column(
                  children: [
                    Text(
                      app.labels.loading,
                      style: TextStyle(
                          color: app.colors.secondaryColorApp,
                          fontSize: widthWidget * 0.015),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: heightWidget * 0.02),
                      child: Consumer<SplashScreenViewModel>(
                          builder: (context, splashProvider, child) {
                        if (splashProvider.isComplete) {
                          Future.microtask(
                            () {
                              Navigator.pushReplacementNamed(
                                  context, EndPoints.home);
                            },
                          );
                        }
                        return LinearProgressIndicator(
                          backgroundColor:
                              app.colors.secondaryColorApp.withOpacity(0.3),
                          valueColor: AlwaysStoppedAnimation(
                              app.colors.loadingBarColorApp),
                          minHeight: heightWidget * 0.01,
                          value: splashProvider.progress,
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

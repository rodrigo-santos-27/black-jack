import 'package:app/utils/app.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App app = App();
    final double widthWidget = MediaQuery.of(context).size.width;
    final double heightWidget = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: app.colors.primaryColorApp,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(app.assetsPath.homeScreen),
                  fit: BoxFit.cover),
            ),
          ),

          //  TOP RIGHT =============================================================

          Positioned(
            top: 0,
            right: -8,
            child: Container(
              height: widthWidget * 0.2,
              width: widthWidget * 0.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(app.assetsPath.homeScreenDeck),
                ),
              ),
            ),
          ),

          //  TOP LEFT =============================================================

          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: widthWidget * 0.2,
              width: widthWidget * 0.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(app.assetsPath.homeScreenDeckAux),
                ),
              ),
            ),
          ),

          //  TOP CENTER =============================================================

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: widthWidget * 0.015,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(app.assetsPath.lineHeader),
                    fit: BoxFit.cover),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: widthWidget * 0.055,
              width: widthWidget * 0.175,
              margin: EdgeInsets.only(top: heightWidget * 0.05),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(app.assetsPath.logo), fit: BoxFit.cover),
              ),
            ),
          ),

          //  BOTTOM =============================================================

          Positioned(
            top: heightWidget * 0.4,
            child: Container(
              height: widthWidget * 0.4,
              width: widthWidget,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(app.assetsPath.homeScreenWood),
                ),
              ),
            ),
          ),
          Positioned(
            top: heightWidget * 0.6,
            child: Container(
              height: widthWidget * 0.4,
              width: widthWidget,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(app.assetsPath.homeScreenBlack),
                ),
              ),
            ),
          ),

          //  CENTER =============================================================

          Align(
            alignment: Alignment.center,
            child: Container(
              height: widthWidget * 0.05,
              width: widthWidget * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(app.assetsPath.homeScreenConvite),
                ),
              ),
            ),
          ),

          //  LEFT SIDE FROM FOOTER =============================================================

          Positioned(
            top: heightWidget * 0.58,
            left: heightWidget * 0.1,
            child: ClipOval(
              child: InkWell(
                child: Container(
                  height: widthWidget * 0.075,
                  width: widthWidget * 0.075,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(app.assetsPath.homeScreenFive),
                    ),
                  ),
                ),
                onTap: () {
                  print('five clicked');
                },
              ),
            ),
          ),
          Positioned(
            top: heightWidget * 0.64,
            left: heightWidget * 0.25,
            child: ClipOval(
              child: InkWell(
                child: Container(
                  height: widthWidget * 0.075,
                  width: widthWidget * 0.075,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(app.assetsPath.homeScreenTen),
                    ),
                  ),
                ),
                onTap: () {
                  print('ten clicked');
                },
              ),
            ),
          ),
          Positioned(
            top: heightWidget * 0.68,
            left: heightWidget * 0.4,
            child: ClipOval(
              child: InkWell(
                child: Container(
                  height: widthWidget * 0.075,
                  width: widthWidget * 0.075,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(app.assetsPath.homeScreenTwoFive),
                    ),
                  ),
                ),
                onTap: () {
                  print('two-five clicked');
                },
              ),
            ),
          ),
          Positioned(
            top: heightWidget * 0.82,
            left: heightWidget * 0.1,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 24.0),
              height: widthWidget * 0.1,
              width: widthWidget * 0.15,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(app.assetsPath.homeScreenMoney),
                ),
              ),
              child: Text('RS 2790,00',
                  style: TextStyle(color: Colors.amber, fontSize: 24)),
            ),
          ),

          //  RIGHT SIDE FROM FOOTER =============================================================

          Positioned(
            top: heightWidget * 0.68,
            right: heightWidget * 0.4,
            child: ClipOval(
              child: InkWell(
                child: Container(
                  height: widthWidget * 0.075,
                  width: widthWidget * 0.075,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(app.assetsPath.homeScreenFiveZero),
                    ),
                  ),
                ),
                onTap: () {
                  print('five-zero clicked');
                },
              ),
            ),
          ),
          Positioned(
            top: heightWidget * 0.64,
            right: heightWidget * 0.25,
            child: ClipOval(
              child: InkWell(
                child: Container(
                  height: widthWidget * 0.075,
                  width: widthWidget * 0.075,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(app.assetsPath.homeScreenOneZeroZero),
                    ),
                  ),
                ),
                onTap: () {
                  print('one zero zero clicked');
                },
              ),
            ),
          ),
          Positioned(
            top: heightWidget * 0.58,
            right: heightWidget * 0.1,
            child: ClipOval(
              child: InkWell(
                child: Container(
                  height: widthWidget * 0.075,
                  width: widthWidget * 0.075,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(app.assetsPath.homeScreenTwoZeroZero),
                    ),
                  ),
                ),
                onTap: () {
                  print('two zero zero clicked');
                },
              ),
            ),
          ),
          Positioned(
            top: heightWidget * 0.87,
            right: heightWidget * 0.1,
            child: InkWell(
              child: Container(
                height: widthWidget * 0.035,
                width: widthWidget * 0.065,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(app.assetsPath.homeScreenSettings)),
                ),
              ),
              onTap: () {
                print('settings clicked');
              },
            ),
          ),
        ],
      ),
    );
  }
}

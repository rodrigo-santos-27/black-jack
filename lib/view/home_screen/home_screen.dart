import 'package:app/model/bets_data.dart';
import 'package:app/model/chip_hover.dart';
import 'package:app/model_view/home_view_model.dart';
import 'package:app/service/app_service.dart';
import 'package:app/utils/app.dart';
import 'package:app/view/home_screen/components/custom_round_rect_clipper.dart';
import 'package:app/view/home_screen/components/image_pulser.dart';
import 'package:app/view/home_screen/components/image_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final App app;

  late Map<String, AnimationController> animationControllers = {};
  late Map<String, Animation> animations = {};

  final AppService appService = AppService();

  @override
  void initState() {
    app = App();
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in animationControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthWidget = MediaQuery.of(context).size.width;
    final double heightWidget = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: app.colors.primaryColorApp,
      body: Consumer<HomeViewModel>(builder: (context, homeViewlModel, child) {
        homeViewlModel.getAnimationController(
            this, animations, animationControllers, homeViewlModel.chips);
        return Stack(
          children: [
            buildBackgroundIMage(),
            buildDeckImage(widthWidget),
            buildDeckAux(widthWidget),
            buildLineHeader(widthWidget),
            buildLogoImage(heightWidget, widthWidget),
            buildWoodImage(heightWidget, widthWidget),
            buildBlackImage(heightWidget, widthWidget),
            buildMakeBetsImages(widthWidget, homeViewlModel),
            buildMoneyStatus(heightWidget, widthWidget),
            buildSettingsButtom(heightWidget, widthWidget),
            buildPainelButtom(heightWidget, widthWidget),
            ...buildListChipsButtons(homeViewlModel, heightWidget, widthWidget)
          ],
        );
      }),
    );
  }

  Widget buildBackgroundIMage() {
    return ImageSize(imagePath: app.assetsPath.homeScreen, fit: BoxFit.cover);
  }

  Widget buildDeckImage(double size) {
    return Positioned(
      top: 0,
      right: -8,
      child: ImageSize(
        height: size * 0.2,
        width: size * 0.2,
        imagePath: app.assetsPath.homeScreenDeck,
      ),
    );
  }

  Widget buildDeckAux(double size) {
    return Positioned(
      top: 0,
      left: 0,
      child: ImageSize(
        height: size * 0.2,
        width: size * 0.2,
        imagePath: app.assetsPath.homeScreenDeckAux,
      ),
    );
  }

  Widget buildLineHeader(double height) {
    return Align(
      alignment: Alignment.topCenter,
      child: ImageSize(
        height: height * 0.015,
        imagePath: app.assetsPath.lineHeader,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildLogoImage(double heightWidget, double widthWidget) {
    return Align(
      alignment: Alignment.topCenter,
      child: ImageSize(
        height: widthWidget * 0.055,
        width: widthWidget * 0.175,
        margin: EdgeInsets.only(top: heightWidget * 0.05),
        imagePath: app.assetsPath.logo,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildWoodImage(double heightWidget, double widthWidget) {
    return Positioned(
      top: heightWidget * 0.4,
      child: ImageSize(
        height: widthWidget * 0.4,
        width: widthWidget,
        imagePath: app.assetsPath.homeScreenWood,
      ),
    );
  }

  Widget buildBlackImage(double heightWidget, double widthWidget) {
    return Positioned(
      top: heightWidget * 0.6,
      child: ImageSize(
        height: widthWidget * 0.4,
        width: widthWidget,
        imagePath: app.assetsPath.homeScreenBlack,
      ),
    );
  }

  Widget buildMakeBetsImages(double widthWidget, HomeViewModel homeViewlModel) {
    return homeViewlModel.betsData.isEmpty
        ? Align(
            alignment: Alignment.center,
            child: ImageSize(
              height: widthWidget * 0.05,
              width: widthWidget * 0.3,
              imagePath: app.assetsPath.homeScreenInvite,
            ),
          )
        : Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: widthWidget * 0.175,
              width: widthWidget * 0.175,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: widthWidget * 0.1,
                    width: widthWidget * 0.1,
                    child: Stack(
                      children: List.generate(
                        homeViewlModel.betsData.length,
                        (index) {
                          return Positioned(
                            top: homeViewlModel.betsData[index].offSetX,
                            left: homeViewlModel.betsData[index].offSetY,
                            child: ImageSize(
                              height: widthWidget * 0.075,
                              width: widthWidget * 0.075,
                              imagePath: homeViewlModel.betsData[index].chip,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: widthWidget * 0.05,
                    width: widthWidget * 0.1,
                    child: Text(
                      appService.sum(homeViewlModel.betsData).toString(),
                      style: GoogleFonts.textMeOne(
                        color: app.colors.secondaryColorApp,
                        fontSize: 48,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  Widget buildMoneyStatus(double heightWidget, double widthWidget) {
    return Positioned(
      top: heightWidget * 0.82,
      left: heightWidget * 0.1,
      child: ImageSize(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
            left: widthWidget * 0.02, top: widthWidget * 0.0035),
        height: widthWidget * 0.1,
        width: widthWidget * 0.15,
        imagePath: app.assetsPath.homeScreenMoney,
        child: const Text('R\$ 2790,00',
            style: TextStyle(color: Colors.amber, fontSize: 24)),
      ),
    );
  }

  Widget buildSettingsButtom(double heightWidget, double widthWidget) {
    return Positioned(
      top: heightWidget * 0.87,
      right: heightWidget * 0.1,
      child: ClipPath(
        clipper: CustomRoundedRectClipper(widthFactor: 0.85, heightFactor: 0.9),
        child: InkWell(
          child: ImageSize(
            height: widthWidget * 0.035,
            width: widthWidget * 0.065,
            alignment: Alignment.center,
            imagePath: app.assetsPath.homeScreenSettings,
          ),
          onTap: () {
            print('settings clicked');
          },
        ),
      ),
    );
  }

  Widget buildPainelButtom(double heightWidget, double widthWidget) {
    return Positioned(
        top: widthWidget * 0.41,
        left: widthWidget * 0.375,
        child: Container(
          color: Colors.amber,
          height: widthWidget * 0.06,
          width: widthWidget * 0.25,
          child: Row(),
        )
        // ClipPath(
        //   clipper: CustomRoundedRectClipper(widthFactor: 0.85, heightFactor: 0.9),
        //   child: InkWell(
        //     child: ImageSize(
        //       height: widthWidget * 0.035,
        //       width: widthWidget * 0.065,
        //       alignment: Alignment.center,
        //       imagePath: app.assetsPath.homeScreenSettings,
        //     ),
        //     onTap: () {
        //       print('settings clicked');
        //     },
        //   ),
        // ),
        );
  }

  List<Widget> buildListChipsButtons(
      HomeViewModel homeViewlModel, double heightWidget, double widthWidget) {
    return homeViewlModel.chips.map(
      (chip) {
        final currentController = animationControllers[chip.name];
        final currentAnimation = animations[chip.name];
        final currentHover =
            homeViewlModel.chipHover.currentHover[chip.name] ?? false;

        if (homeViewlModel.chipHover.allHover) {
          if (!currentHover) {
            currentController?.reset();
          }
        } else {
          currentController?.repeat(reverse: true);
        }

        return Positioned(
          top: heightWidget * chip.topFactor,
          left: chip.sideLeftFactor > 0.0
              ? widthWidget * chip.sideLeftFactor
              : null,
          right: chip.sideRightFactor > 0.0
              ? widthWidget * chip.sideRightFactor
              : null,
          child: ImagePulser(
            heightWidget: widthWidget * chip.offSetHeight,
            widthWidget: widthWidget * chip.offSetWidth,
            offSet: widthWidget * chip.offSetGlow,
            glow: chip.glow,
            image: ImageSize(
              height: widthWidget * chip.offSetHeight,
              width: widthWidget * chip.offSetWidth,
              imagePath: chip.imagePath,
            ),
            onTap: () {
              homeViewlModel.saveBets(BetsData(
                  chip: chip.chipPath,
                  value: chip.value,
                  offSetX: appService.getRandomValue(),
                  offSetY: appService.getRandomValue()));
            },
            onHover: (hover) {
              homeViewlModel.setChipHover(
                  ChipHover(allHover: hover, currentHover: {chip.name: hover}));
            },
            animationController: currentController!,
            animation: currentAnimation!,
          ),
        );
      },
    ).toList();
  }
}

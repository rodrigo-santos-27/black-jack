import 'package:app/components/image_size.dart';
import 'package:app/model_view/black_jack_view_model.dart';
import 'package:app/model_view/start_view_model.dart';
import 'package:app/service/app_service.dart';
import 'package:app/utils/app.dart';
import 'package:app/utils/enums.dart';
import 'package:app/widgets/build_background_image.dart';
import 'package:app/widgets/build_black_image.dart';
import 'package:app/widgets/build_chips_area.dart';
import 'package:app/widgets/build_chips_buttons.dart';
import 'package:app/widgets/build_deck_aux_image.dart';
import 'package:app/widgets/build_deck_image.dart';
import 'package:app/widgets/build_line_header.dart';
import 'package:app/widgets/build_logo_image.dart';
import 'package:app/widgets/build_money_status.dart';
import 'package:app/widgets/build_panel_buttons_play.dart';
import 'package:app/widgets/build_settings_button.dart';
import 'package:app/widgets/build_wood_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  late final App app;
  final AppService appService = AppService();

  bool buildLeftCards = false;
  bool buildRightCards = false;

  @override
  void initState() {
    super.initState();
    app = App();
    fetchInitialCards(context);
  }

  Future<void> fetchInitialCards(BuildContext context) async {
    final cardProvider =
        Provider.of<BlackjackViewModel>(context, listen: false);
    await cardProvider
        .createNewDeck()
        .whenComplete(() => cardProvider.getCards(BlackjackPanelAction.deal));
  }

  @override
  Widget build(BuildContext context) {
    final double widthWidget = MediaQuery.of(context).size.width;
    final double heightWidget = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: app.colors.primaryColorApp,
      body: Consumer2<StartViewModel, BlackjackViewModel>(
        builder: (context, startViewModel, blackjack, child) {
          BlackjackResult result = blackjack.determineWinner();

          if (blackjack.totalValueOfLeftCards > 21 ||
              blackjack.totalValueOfRightCards > 21) {
            String message;
            switch (result) {
              case BlackjackResult.LeftWins:
                message = "Left Wins!";
                break;
              case BlackjackResult.RightWins:
                message = "Right Wins!";
                break;
              case BlackjackResult.Draw:
                message = "It's a Draw!";
                break;
              case BlackjackResult.BothBust:
                message = "Both Bust!";
                break;
            }
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Round Over"),
                    content: Text(message),
                    actions: <Widget>[
                      TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          blackjack.clearCardsFromLeftList();
                          blackjack.clearCardsFromRightList();
                          Navigator.of(context)
                              .pushReplacementNamed(EndPoints.home);
                        },
                      )
                    ],
                  );
                },
              );
            });
          }

          return Stack(
            children: [
              BuildBackgroundImage(path: app.assetsPath.homeScreen),
              BuildDeckImage(
                  heightWidget: widthWidget, widthWidget: widthWidget),
              BuildDeckAuxImage(
                  heightWidget: widthWidget, widthWidget: widthWidget),
              BuildLineImage(heightWidget: widthWidget),
              BuildLogoImage(
                  heightWidget: widthWidget, widthWidget: widthWidget),
              BuildWoodImage(
                  heightWidget: heightWidget, widthWidget: widthWidget),
              BuildBlackImage(
                  heightWidget: heightWidget, widthWidget: widthWidget),
              BuildChipsArea(
                  widthWidget: widthWidget,
                  viewlModel: startViewModel,
                  service: appService),
              BuildMoneyStatus(
                  heightWidget: heightWidget, widthWidget: widthWidget),
              BuildSettingsButton(
                  heightWidget: heightWidget, widthWidget: widthWidget),
              BuildPanelButtonsPlay(
                heightWidget: heightWidget,
                widthWidget: widthWidget,
                viewModel: startViewModel,
              ),
              BuildChipsButtons(
                viewModel: startViewModel,
                heightWidget: heightWidget,
                widthWidget: widthWidget,
                appService: appService,
                effect: false,
              ),
              buildLeftCard(widthWidget),
              buildRightCard(widthWidget),
              buildLeftScore(widthWidget),
              buildRightScore(widthWidget)
            ],
          );
        },
      ),
    );
  }

  Widget buildLeftCard(double widthWidget) {
    return Consumer<BlackjackViewModel>(
      builder: (context, blackjackLeft, child) {
        return Stack(
          children: List.generate(
            blackjackLeft.leftCards!.length,
            (index) {
              return Positioned(
                top: widthWidget * 0.135,
                left: widthWidget * getOffsetCards(index),
                child: Container(
                  height: widthWidget * 0.1,
                  width: widthWidget * 0.07,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.network(
                    blackjackLeft.leftCards![index].image,
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildRightCard(double widthWidget) {
    return Consumer<BlackjackViewModel>(
      builder: (context, blackjackRight, child) {
        return Stack(
          children: List.generate(blackjackRight.rightCards!.length, (index) {
            return Positioned(
              top: widthWidget * 0.135,
              right: widthWidget * getOffsetCards(index),
              child: Container(
                height: widthWidget * 0.1,
                width: widthWidget * 0.07,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Image.network(
                  blackjackRight.rightCards![index].image,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

Widget buildLeftScore(double widthWidget) {
  return Consumer<BlackjackViewModel>(
    builder: (context, blackjackLeft, child) {
      return Positioned(
        top: widthWidget * 0.25,
        left: widthWidget * 0.25,
        height: widthWidget * 0.05,
        width: widthWidget * getOffsetScore(blackjackLeft.leftCards!.length),
        child: Container(
          alignment: Alignment.topCenter,
          child: Stack(alignment: Alignment.topCenter, children: [
            ImageSize(
              height: 56,
              width: 48,
              imagePath: 'assets/score.png',
              fit: BoxFit.fill,
            ),
            Container(
              height: 56,
              padding: EdgeInsets.only(top: 16),
              child: Text(
                blackjackLeft.totalValueOfLeftCards.toString(),
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            )
          ]),
        ),
      );
    },
  );
}

Widget buildRightScore(double widthWidget) {
  return Consumer<BlackjackViewModel>(
    builder: (context, blackjackRight, child) {
      return Positioned(
        top: widthWidget * 0.25,
        right: widthWidget * 0.25,
        height: widthWidget * 0.05,
        width: widthWidget * getOffsetScore(blackjackRight.rightCards!.length),
        child: Container(
          alignment: Alignment.topCenter,
          child: Stack(alignment: Alignment.topCenter, children: [
            ImageSize(
              height: 56,
              width: 48,
              imagePath: 'assets/score.png',
              fit: BoxFit.fill,
            ),
            Container(
              height: 56,
              padding: EdgeInsets.only(top: 16),
              child: Text(
                blackjackRight.totalValueOfRightCards.toString(),
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            )
          ]),
        ),
      );
    },
  );
}

double getOffsetCards(int index) {
  switch (index) {
    case 0:
      return 0.25;
    case 1:
      return 0.265;
    case 2:
      return 0.280;
    case 3:
      return 0.295;
    case 4:
      return 0.310;
    case 5:
      return 0.325;
    case 6:
      return 0.340;
    default:
      return 0.355;
  }
}

double getOffsetScore(int index) {
  switch (index) {
    case 1:
      return 0.07;
    case 2:
      return 0.085;
    case 3:
      return 0.1;
    case 4:
      return 0.115;
    case 5:
      return 0.130;
    case 6:
      return 0.145;
    default:
      return 0.07;
  }
}

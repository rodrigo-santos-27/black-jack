import 'package:app/service/app_service.dart';
import 'package:app/utils/app.dart';
import 'package:app/utils/enums.dart';
import 'package:app/view_model/black_jack_view_model.dart';
import 'package:app/view_model/start_view_model.dart';
import 'package:app/widgets/build_background_image.dart';
import 'package:app/widgets/build_black_image.dart';
import 'package:app/widgets/build_cards.dart';
import 'package:app/widgets/build_chips_area.dart';
import 'package:app/widgets/build_chips_buttons.dart';
import 'package:app/widgets/build_deck_aux_image.dart';
import 'package:app/widgets/build_deck_image.dart';
import 'package:app/widgets/build_line_header.dart';
import 'package:app/widgets/build_logo_image.dart';
import 'package:app/widgets/build_money_status.dart';
import 'package:app/widgets/build_panel_buttons_play.dart';
import 'package:app/widgets/build_scores.dart';
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
    await cardProvider.createNewDeck().whenComplete(() {
      cardProvider
          .getCards(BlackjackPanelAction.deal)
          .whenComplete(() => cardProvider.getCards(BlackjackPanelAction.deal));
    });
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
                barrierDismissible: false,
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
              BuildScores(heightWidget: heightWidget, widthWidget: widthWidget),
              BuildCards(heightWidget: heightWidget, widthWidget: widthWidget)
            ],
          );
        },
      ),
    );
  }
}

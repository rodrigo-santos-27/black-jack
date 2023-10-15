import 'package:app/components/empty.dart';
import 'package:app/model/card_model.dart';
import 'package:app/model_view/black_jack_view_model.dart';
import 'package:app/model_view/start_view_model.dart';
import 'package:app/service/app_service.dart';
import 'package:app/utils/app.dart';
import 'package:app/widgets/build_background_image.dart';
import 'package:app/widgets/build_black_image.dart';
import 'package:app/widgets/build_chips_area.dart';
import 'package:app/widgets/build_chips_buttons.dart';
import 'package:app/widgets/build_deck_aux_image.dart';
import 'package:app/widgets/build_deck_image.dart';
import 'package:app/widgets/build_line_header.dart';
import 'package:app/widgets/build_logo_image.dart';
import 'package:app/widgets/build_money_status.dart';
import 'package:app/widgets/build_panel_buttons.dart';
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

  @override
  void initState() {
    app = App();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Starting Game!');
    final double widthWidget = MediaQuery.of(context).size.width;
    final double heightWidget = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: app.colors.primaryColorApp,
      body: Consumer2<StartViewModel, BlackjackViewModel>(
        builder: (context, startViewModel, blackjackViewModel, child) {
          return FutureBuilder<void>(
            future: blackjackViewModel.createNewDeck(),
            builder: (context, snapshot) {
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
                  BuildPanelButtons(
                    heightWidget: heightWidget,
                    widthWidget: widthWidget,
                    viewlModel: startViewModel,
                  ),
                  BuildChipsButtons(
                    viewModel: startViewModel,
                    heightWidget: heightWidget,
                    widthWidget: widthWidget,
                    appService: appService,
                    effect: false,
                  ),
                  buildLeftCard(widthWidget, blackjackViewModel)
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget buildLeftCard(
      double widthWidget, BlackjackViewModel blackjackViewModel) {
    return FutureBuilder<List<CardModel>>(
        future: blackjackViewModel.getCards(2),
        builder: (context, card) {
          print(card.data!.last);
          if (ConnectionState.done == card.connectionState) {
            return Positioned(
              top: widthWidget * 0.135,
              left: widthWidget * 0.25,
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
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://deckofcardsapi.com/static/img/aceDiamonds.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          } else {
            return const Empty();
          }
        });
  }
}

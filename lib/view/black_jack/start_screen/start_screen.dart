import 'package:app/model_view/black_jack_view_model.dart';
import 'package:app/model_view/start_view_model.dart';
import 'package:app/repository/static_widget_position.dart';
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

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  late final App app;
  StaticImagePosition positions = StaticImagePosition();

  late Map<String, AnimationController> animationControllers = {};
  late Map<String, Animation> animations = {};

  final AppService appService = AppService();

  @override
  void initState() {
    super.initState();
    app = App();
    final startViewModel = Provider.of<StartViewModel>(context, listen: false);
    startViewModel.getAnimationController(
        this, animations, animationControllers, startViewModel.chips);
  }

  @override
  void dispose() {
    for (var controller in animationControllers.values) {
      if (controller.isAnimating) {
        controller.stop();
      }
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
      body: Consumer2<StartViewModel, BlackjackViewModel>(
        builder: (context, startViewModel, blackJackViewModel, child) {
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
                animationControllers: animationControllers,
                animations: animations,
                appService: appService,
                effect: true,
              )
            ],
          );
        },
      ),
    );
  }
}

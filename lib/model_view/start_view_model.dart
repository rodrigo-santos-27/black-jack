import 'package:app/model/bets_data.dart';
import 'package:app/model/chip_data.dart';
import 'package:app/model/chip_hover.dart';
import 'package:app/model/panel_button.dart';
import 'package:app/repository/static_chip_data.dart';
import 'package:app/repository/static_panel_button.dart';
import 'package:flutter/material.dart';

class StartViewModel extends ChangeNotifier {
  List<ChipData> chips = StaticChipData.chips;
  List<PanelButton> panelButton = StaticPanelButton.panelButtonStart;

  ChipHover _chipHover = ChipHover(allHover: false, currentHover: {});
  ChipHover get chipHover => _chipHover;

  final List<BetsData> _betsData = [];
  List<BetsData> get betsData => _betsData;

  AnimationController getAnimationController(
    homeScreenState,
    Map<String, Animation> animations,
    Map<String, AnimationController> animationControllers,
    List<ChipData> chips,
  ) {
    late AnimationController controller;
    for (ChipData chip in chips) {
      controller = AnimationController(
          vsync: homeScreenState, duration: const Duration(seconds: 2));
      animationControllers[chip.name] = controller;
      final animation = Tween(begin: 0.0, end: 12.0)
          .animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
      animations[chip.name] = animation;
      controller.repeat(reverse: true);
    }

    return controller;
  }

  void setChipHover(ChipHover newChipHover) {
    _chipHover = newChipHover;
    notifyListeners();
  }

  void saveBets(BetsData bet) {
    _betsData.add(bet);
    notifyListeners();
  }

  void clearBets() {
    _betsData.clear();
    notifyListeners();
  }
}

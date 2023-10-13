import 'package:app/model/chip_data.dart';
import 'package:app/model/static_data/static_chip_data.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<ChipData> chips = StaticChipData.chips;

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
}

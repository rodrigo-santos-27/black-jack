import 'package:app/components/image_pulser.dart';
import 'package:app/components/image_size.dart';
import 'package:app/model/bets_data.dart';
import 'package:app/model/chip_hover.dart';
import 'package:app/model_view/start_view_model.dart';
import 'package:app/service/app_service.dart';
import 'package:flutter/material.dart';

class BuildChipsButtons extends StatelessWidget {
  const BuildChipsButtons(
      {super.key,
      required this.viewModel,
      required this.heightWidget,
      required this.widthWidget,
      required this.appService,
      this.animationControllers,
      this.animations,
      required this.effect});

  final StartViewModel viewModel;
  final double heightWidget;
  final double widthWidget;
  final Map<String, AnimationController>? animationControllers;
  final Map<String, Animation>? animations;
  final AppService appService;
  final bool effect;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ...effect
          ? buildListChipsButtonsWithEffect(
              viewModel, heightWidget, widthWidget)
          : buildListChipsButtonsWithoutEffect(
              viewModel, heightWidget, widthWidget)
    ]);
  }

  List<Widget> buildListChipsButtonsWithEffect(
      StartViewModel viewModel, double heightWidget, double widthWidget) {
    return viewModel.chips.map(
      (chip) {
        final currentController = animationControllers![chip.name];
        final currentAnimation = animations![chip.name];
        final currentHover =
            viewModel.chipHover.currentHover[chip.name] ?? false;

        if (viewModel.chipHover.allHover) {
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
              viewModel.saveBets(BetsData(
                  chip: chip.chipPath,
                  value: chip.value,
                  offSetX: appService.getRandomValue(),
                  offSetY: appService.getRandomValue()));
            },
            onHover: (hover) {
              viewModel.setChipHover(
                  ChipHover(allHover: hover, currentHover: {chip.name: hover}));
            },
            animationController: currentController!,
            animation: currentAnimation!,
          ),
        );
      },
    ).toList();
  }

  List<Widget> buildListChipsButtonsWithoutEffect(
      StartViewModel viewModel, double heightWidget, double widthWidget) {
    return viewModel.chips.map(
      (chip) {
        return Positioned(
          top: heightWidget * chip.topFactor,
          left: chip.sideLeftFactor > 0.0
              ? widthWidget * chip.sideLeftFactor
              : null,
          right: chip.sideRightFactor > 0.0
              ? widthWidget * chip.sideRightFactor
              : null,
          child: ImageSize(
            height: widthWidget * chip.offSetHeight,
            width: widthWidget * chip.offSetWidth,
            imagePath: chip.imagePath,
          ),
        );
      },
    ).toList();
  }
}

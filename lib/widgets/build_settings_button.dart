import 'package:app/components/custom_round_rect_clipper.dart';
import 'package:app/components/image_size.dart';
import 'package:app/model/widget_position.dart';
import 'package:app/model_view/black_jack_view_model.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildSettingsButton extends StatelessWidget {
  const BuildSettingsButton({
    Key? key,
    required this.heightWidget,
    required this.widthWidget,
  }) : super(key: key);

  final double heightWidget;
  final double widthWidget;

  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticImagePosition.imagesPositions
        .firstWhere((positionItem) => positionItem.id == Positions.settings);

    return Consumer<BlackjackViewModel>(builder: (context, viewModel, child) {
      return Positioned(
        top: heightWidget * (widgetPosition.top ?? 0.0),
        right: heightWidget * (widgetPosition.right ?? 0.0),
        child: ClipPath(
          clipper: CustomRoundedRectClipper(
              widthFactor: widgetPosition.widthFactor ?? 0.0,
              heightFactor: widgetPosition.heightFactor ?? 0.0),
          child: InkWell(
            child: ImageSize(
              height: widthWidget * (widgetPosition.heightImage ?? 0.0),
              width: widthWidget * (widgetPosition.widthImage ?? 0.0),
              alignment: widgetPosition.alignment,
              imagePath: widgetPosition.path,
            ),
            onTap: () {
              print('settings');
              viewModel.getCards(2);
            },
          ),
        ),
      );
    });
  }
}

import 'package:app/components/image_size.dart';
import 'package:app/model/widget_position.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';

class BuildDeckAuxImage extends StatelessWidget {
  const BuildDeckAuxImage({
    Key? key,
    required this.heightWidget,
    required this.widthWidget,
  }) : super(key: key);

  final double heightWidget;
  final double widthWidget;

  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticImagePosition.imagesPositions
        .firstWhere((positionItem) => positionItem.id == Positions.deckAux);

    return Positioned(
      top: widthWidget * (widgetPosition.top ?? 0.0),
      left: widthWidget * (widgetPosition.left ?? 0.0),
      child: ImageSize(
        height: heightWidget * (widgetPosition.heightImage ?? 0.0),
        width: widthWidget * (widgetPosition.widthImage ?? 0.0),
        imagePath: widgetPosition.path,
      ),
    );
  }
}

import 'package:app/model/widget_position.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:app/components/image_size.dart';
import 'package:flutter/material.dart';

class BuildWoodImage extends StatelessWidget {
  const BuildWoodImage({
    Key? key,
    required this.heightWidget,
    required this.widthWidget,
  }) : super(key: key);

  final double heightWidget;
  final double widthWidget;

  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticImagePosition.imagesPositions
        .firstWhere((positionItem) => positionItem.id == Positions.wood);

    return Positioned(
      top: heightWidget * (widgetPosition.top ?? 0.0),
      child: ImageSize(
        height: widthWidget * (widgetPosition.heightImage ?? 0.0),
        width: widthWidget * (widgetPosition.widthImage ?? 0.0),
        imagePath: widgetPosition.path,
      ),
    );
  }
}

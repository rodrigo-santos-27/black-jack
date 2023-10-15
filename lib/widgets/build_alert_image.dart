import 'package:app/model/widget_position.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:app/components/image_size.dart';
import 'package:flutter/material.dart';

class BuildAlertImage extends StatelessWidget {
  const BuildAlertImage({
    Key? key,
    required this.widthWidget,
  }) : super(key: key);

  final double widthWidget;

  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticImagePosition.imagesPositions
        .firstWhere((positionItem) => positionItem.id == Positions.alert);

    return Align(
      alignment: widgetPosition.alignment ?? Alignment.center,
      child: ImageSize(
        height: widthWidget * (widgetPosition.heightImage ?? 0.0),
        width: widthWidget * (widgetPosition.widthImage ?? 0.0),
        imagePath: widgetPosition.path,
      ),
    );
  }
}

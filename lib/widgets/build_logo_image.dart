import 'package:app/model/widget_position.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:app/components/image_size.dart';
import 'package:flutter/material.dart';

class BuildLogoImage extends StatelessWidget {
  const BuildLogoImage({
    Key? key,
    required this.heightWidget,
    required this.widthWidget,
  }) : super(key: key);

  final double heightWidget;
  final double widthWidget;

  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticImagePosition.imagesPositions
        .firstWhere((positionItem) => positionItem.id == Positions.logo);

    return Align(
      alignment: widgetPosition.alignment ?? Alignment.topCenter,
      child: ImageSize(
        height: heightWidget * (widgetPosition.heightImage ?? 0.0),
        width: widthWidget * (widgetPosition.widthImage ?? 0.0),
        margin: EdgeInsets.only(
          top: heightWidget * (widgetPosition.margin!.top ?? 0.0),
        ),
        imagePath: widgetPosition.path,
        fit: widgetPosition.fit,
      ),
    );
  }
}

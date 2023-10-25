import 'package:app/components/image_size.dart';
import 'package:app/model/widget_position.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';

class BuildDeckImage extends StatelessWidget {
  const BuildDeckImage({
    Key? key,
    required this.heightWidget,
    required this.widthWidget,
  }) : super(key: key);

  final double heightWidget;
  final double widthWidget;

  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticWidgetPosition.widgets
        .firstWhere((positionItem) => positionItem.id == Positions.deck);

    return Positioned(
      top: widgetPosition.top,
      right: widgetPosition.right,
      child: ImageSize(
        height: heightWidget * (widgetPosition.heightImage ?? 0.0),
        width: widthWidget * (widgetPosition.widthImage ?? 0.0),
        imagePath: widgetPosition.path,
      ),
    );
  }
}

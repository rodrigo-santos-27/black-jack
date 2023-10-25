import 'package:app/components/image_size.dart';
import 'package:app/model/widget_position.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';

class BuildLineImage extends StatelessWidget {
  const BuildLineImage({
    Key? key,
    required this.heightWidget,
  }) : super(key: key);

  final double heightWidget;

  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticWidgetPosition.widgets
        .firstWhere((positionItem) => positionItem.id == Positions.line);

    return Align(
      alignment: widgetPosition.alignment ?? Alignment.topCenter,
      child: ImageSize(
        height: heightWidget * (widgetPosition.heightImage ?? 0.0),
        imagePath: widgetPosition.path,
        fit: widgetPosition.fit,
      ),
    );
  }
}

import 'package:app/model/widget_position.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:app/components/image_size.dart';
import 'package:flutter/material.dart';

class BuildMoneyStatus extends StatelessWidget {
  const BuildMoneyStatus({
    Key? key,
    required this.heightWidget,
    required this.widthWidget,
  }) : super(key: key);

  final double heightWidget;
  final double widthWidget;

  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticImagePosition.imagesPositions
        .firstWhere((positionItem) => positionItem.id == Positions.money);

    return Positioned(
      top: heightWidget * (widgetPosition.top ?? 0.0),
      left: heightWidget * (widgetPosition.left ?? 0.0),
      child: ImageSize(
          alignment: widgetPosition.alignment,
          height: widthWidget * (widgetPosition.heightImage ?? 0.0),
          width: widthWidget * (widgetPosition.widthImage ?? 0.0),
          imagePath: widgetPosition.path,
          padding: EdgeInsets.only(
              left: widthWidget * (widgetPosition.padding!.left ?? 0.0),
              top: widthWidget * (widgetPosition.padding!.top ?? 0.0)),
          child: const Text('R\$ 2790,00',
              style: TextStyle(color: Colors.amber, fontSize: 24))),
    );
  }
}

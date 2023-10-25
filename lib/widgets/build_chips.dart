import 'package:app/components/image_size.dart';
import 'package:app/model/bets_data.dart';
import 'package:app/model/widget_position.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';

class BuildChips extends StatelessWidget {
  const BuildChips(
      {super.key,
      required this.heightWidget,
      required this.widthWidget,
      required this.coinList});

  final double heightWidget;
  final double widthWidget;
  final List<BetsData> coinList;

  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticWidgetPosition.widgets
        .firstWhere((positionItem) => positionItem.id == Positions.chips);

    return SizedBox(
      height: widthWidget * (widgetPosition.heightWidget ?? 0.0),
      width: widthWidget * (widgetPosition.widthWidget ?? 0.0),
      child: Stack(
        children: List.generate(
          coinList.length,
          (index) {
            return Positioned(
              top: coinList[index].offSetX,
              left: coinList[index].offSetY,
              child: ImageSize(
                height: widthWidget * (widgetPosition.heightImage ?? 0.0),
                width: widthWidget * (widgetPosition.widthImage ?? 0.0),
                imagePath: coinList[index].chip,
              ),
            );
          },
        ),
      ),
    );
  }
}

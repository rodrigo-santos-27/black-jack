import 'package:app/model/widget_position.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildSumCoin extends StatelessWidget {
  const BuildSumCoin({super.key, required this.widthWidget, required this.sum});
  final double widthWidget;
  final String sum;
  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticWidgetPosition.widgets
        .firstWhere((positionItem) => positionItem.id == Positions.sum);

    return Container(
      alignment: widgetPosition.alignment,
      height: widthWidget * 0.05,
      width: widthWidget * 0.1,
      child: Text(
        sum,
        style: GoogleFonts.textMeOne(
          color: widgetPosition.background,
          fontSize: widgetPosition.fontSize,
        ),
      ),
    );
  }
}

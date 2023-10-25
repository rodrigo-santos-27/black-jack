import 'package:app/components/image_size.dart';
import 'package:app/model/widget_position.dart';
import 'package:app/view_model/black_jack_view_model.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildScores extends StatelessWidget {
  const BuildScores({
    Key? key,
    required this.heightWidget,
    required this.widthWidget,
  }) : super(key: key);

  final double heightWidget;
  final double widthWidget;

  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticWidgetPosition.widgets
        .firstWhere((positionItem) => positionItem.id == Positions.scores);

    return Consumer<BlackjackViewModel>(
      builder: (context, viewModel, child) {
        const int sides = 2;

        return Stack(
          children: List.generate(
            sides,
            (index) {
              bool side = index == 0.0 ? true : false;
              return Positioned(
                top: widthWidget * (widgetPosition.top ?? 0.0),
                right:
                    side ? null : widthWidget * (widgetPosition.right ?? 0.0),
                left: side ? widthWidget * (widgetPosition.left ?? 0.0) : null,
                height: widthWidget * (widgetPosition.heightWidget ?? 0.0),
                width: widthWidget *
                    getOffsetScore(side
                        ? viewModel.leftCards!.length
                        : viewModel.rightCards!.length),
                child: Container(
                  alignment: widgetPosition.alignment,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      ImageSize(
                          height:
                              widthWidget * (widgetPosition.heightImage ?? 0.0),
                          width:
                              widthWidget * (widgetPosition.widthImage ?? 0.0),
                          imagePath: widgetPosition.path,
                          fit: BoxFit.fill),
                      Container(
                        height:
                            widthWidget * (widgetPosition.widthImage ?? 0.0),
                        padding: EdgeInsets.only(
                            top: widthWidget *
                                (widgetPosition.heightFactor ?? 0.0)),
                        child: Text(
                          side
                              ? viewModel.totalValueOfLeftCards.toString()
                              : viewModel.totalValueOfRightCards.toString(),
                          style: TextStyle(
                              color: widgetPosition.background,
                              fontSize: widthWidget *
                                  (widgetPosition.fontSize ?? 0.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

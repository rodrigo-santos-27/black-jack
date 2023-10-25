import 'package:app/model/widget_position.dart';
import 'package:app/view_model/start_view_model.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/service/app_service.dart';
import 'package:app/utils/enums.dart';
import 'package:app/widgets/build_alert_image.dart';
import 'package:app/widgets/build_chips.dart';
import 'package:app/widgets/build_sum_coin.dart';
import 'package:flutter/material.dart';

class BuildChipsArea extends StatelessWidget {
  const BuildChipsArea(
      {super.key,
      required this.widthWidget,
      required this.viewlModel,
      required this.service});

  final double widthWidget;
  final StartViewModel viewlModel;
  final AppService service;
  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticWidgetPosition.widgets
        .firstWhere((positionItem) => positionItem.id == Positions.chipsArea);

    return viewlModel.betsData.isEmpty
        ? BuildAlertImage(widthWidget: widthWidget)
        : Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: widthWidget * (widgetPosition.heightWidget ?? 0.0),
              width: widthWidget * (widgetPosition.widthWidget ?? 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BuildChips(
                      heightWidget: widthWidget,
                      widthWidget: widthWidget,
                      coinList: viewlModel.betsData),
                  BuildSumCoin(
                      widthWidget: widthWidget,
                      sum: service.sum(viewlModel.betsData).toString())
                ],
              ),
            ),
          );
  }
}

import 'package:app/model/widget_position.dart';
import 'package:app/view_model/black_jack_view_model.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildCards extends StatelessWidget {
  const BuildCards({
    Key? key,
    required this.heightWidget,
    required this.widthWidget,
  }) : super(key: key);

  final double heightWidget;
  final double widthWidget;

  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticWidgetPosition.widgets
        .firstWhere((positionItem) => positionItem.id == Positions.cards);

    return Consumer<BlackjackViewModel>(
      builder: (context, viewModel, child) {
        const int sides = 2;
        return Stack(
          children: List.generate(
            sides,
            (index) {
              bool side = index == 0.0 ? true : false;
              return Stack(
                children: List.generate(
                  side
                      ? viewModel.leftCards!.length
                      : viewModel.rightCards!.length,
                  (index) {
                    return Positioned(
                      top: widthWidget * (widgetPosition.top ?? 0.0),
                      left: side ? widthWidget * getOffsetCards(index) : null,
                      right: side ? null : widthWidget * getOffsetCards(index),
                      child: Container(
                        height:
                            widthWidget * (widgetPosition.heightWidget ?? 0.0),
                        width:
                            widthWidget * (widgetPosition.widthWidget ?? 0.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Image.network(
                          side
                              ? viewModel.leftCards![index].image
                              : viewModel.rightCards![index].image,
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

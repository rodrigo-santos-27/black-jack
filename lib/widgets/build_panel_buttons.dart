import 'package:app/components/custom_round_rect_clipper.dart';
import 'package:app/components/empty.dart';
import 'package:app/components/image_size.dart';
import 'package:app/model/panel_button.dart';
import 'package:app/model/widget_position.dart';
import 'package:app/model_view/black_jack_view_model.dart';
import 'package:app/model_view/start_view_model.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildPanelButtons extends StatelessWidget {
  const BuildPanelButtons({
    Key? key,
    required this.heightWidget,
    required this.widthWidget,
    required this.viewModel,
  }) : super(key: key);

  final double heightWidget;
  final double widthWidget;
  final StartViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    WidgetPosition widgetPosition = StaticImagePosition.imagesPositions
        .firstWhere((positionItem) => positionItem.id == Positions.panel);

    List<PanelButton> panelButton = viewModel.panelButton;
    List<bool> clicked = List.filled(panelButton.length, false);

    return viewModel.betsData.isNotEmpty
        ? Consumer<BlackjackViewModel>(
            builder: (context, blackJackViewModel, child) {
            return Positioned(
              top: widthWidget * (widgetPosition.top ?? 0.0),
              left: widthWidget * (widgetPosition.left ?? 0.0),
              child: SizedBox(
                height: widthWidget * (widgetPosition.heightWidget ?? 0.0),
                width: widthWidget * (widgetPosition.widthWidget ?? 0.0),
                child: StatefulBuilder(
                  builder: (context, panel) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        panelButton.length,
                        (index) {
                          return Column(
                            children: [
                              ClipPath(
                                clipper: CustomRoundedRectClipper(
                                    widthFactor: 1, heightFactor: 1),
                                child: InkWell(
                                  child: ImageSize(
                                    height: widthWidget *
                                        (widgetPosition.heightImage ?? 0.0),
                                    width: widthWidget *
                                        (widgetPosition.widthImage ?? 0.0),
                                    alignment: Alignment.center,
                                    imagePath: clicked[index]
                                        ? panelButton[index].pathDown
                                        : panelButton[index].pathUp,
                                  ),
                                  onTap: () {
                                    panel(() {
                                      clicked[index] = !clicked[index];
                                      Future.delayed(
                                              const Duration(milliseconds: 100))
                                          .whenComplete(() {
                                        panel(() {
                                          clicked[index] = !clicked[index];
                                        });
                                        switch (panelButton[index].action) {
                                          case BlackjackPanelAction.clear:
                                            viewModel.clearBets();
                                            blackJackViewModel.dispatch(
                                                BlackjackAction.endGame,
                                                context);
                                            break;
                                          case BlackjackPanelAction.deal:
                                            blackJackViewModel.dispatch(
                                                BlackjackAction.startGame,
                                                context);
                                            break;
                                          default:
                                        }
                                      });
                                    });
                                  },
                                ),
                              ),
                              Text(
                                panelButton[index].name,
                                style: TextStyle(
                                  color: widgetPosition.background,
                                  fontSize: widgetPosition.fontSize,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          })
        : const Empty();
  }
}

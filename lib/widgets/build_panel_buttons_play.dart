import 'package:app/components/custom_round_rect_clipper.dart';
import 'package:app/components/empty.dart';
import 'package:app/components/image_size.dart';
import 'package:app/model/panel_button.dart';
import 'package:app/model/widget_position.dart';
import 'package:app/view_model/black_jack_view_model.dart';
import 'package:app/view_model/start_view_model.dart';
import 'package:app/repository/static_widget_position.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildPanelButtonsPlay extends StatelessWidget {
  const BuildPanelButtonsPlay({
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
    WidgetPosition widgetPosition = StaticWidgetPosition.widgets
        .firstWhere((positionItem) => positionItem.id == Positions.play);

    List<PanelButton> panelButtonPlay = viewModel.panelButtonPlay;

    List<bool> clicked = List.filled(panelButtonPlay.length, false);

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
                        panelButtonPlay.length,
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
                                        ? panelButtonPlay[index].pathDown
                                        : panelButtonPlay[index].pathUp,
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
                                        switch (panelButtonPlay[index].action) {
                                          case BlackjackPanelAction.stand:
                                            print('Stand');
                                            blackJackViewModel.getCards(
                                                BlackjackPanelAction.stand);
                                            // turn on card (table) before to call new card
                                            break;
                                          case BlackjackPanelAction.double:
                                            print('Double');
                                            blackJackViewModel.getCards(
                                                BlackjackPanelAction.double);
                                            // double tbets value and call twice card
                                            break;
                                          case BlackjackPanelAction.hit:
                                            print('Hit');
                                            blackJackViewModel.getCards(
                                                BlackjackPanelAction.hit);
                                            // turn on card (me) before to call new card
                                            break;
                                          default:
                                        }
                                      });
                                    });
                                  },
                                ),
                              ),
                              Text(
                                panelButtonPlay[index].name,
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

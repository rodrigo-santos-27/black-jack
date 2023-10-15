import 'package:app/model/panel_button.dart';
import 'package:app/utils/app.dart';
import 'package:app/utils/enums.dart';

class StaticPanelButton {
  static App app = App();
  static List<PanelButton> panelButtonStart = [
    PanelButton(
        name: 'Limpar',
        pathUp: app.assetsPath.clearUp,
        pathDown: app.assetsPath.clearDown,
        action: BlackjackPanelAction.clear),
    PanelButton(
        name: 'Dar Cartas',
        pathUp: app.assetsPath.dealUp,
        pathDown: app.assetsPath.dealDown,
        action: BlackjackPanelAction.deal)
  ];
}

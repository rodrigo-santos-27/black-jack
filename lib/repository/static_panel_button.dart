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
  static List<PanelButton> panelButtonPlay = [
    PanelButton(
        name: 'Ficar',
        pathUp: app.assetsPath.standUp,
        pathDown: app.assetsPath.standDown,
        action: BlackjackPanelAction.stand),
    PanelButton(
        name: 'Dobrar',
        pathUp: app.assetsPath.doubleUp,
        pathDown: app.assetsPath.doubleDown,
        action: BlackjackPanelAction.double),
    PanelButton(
        name: 'Acertar',
        pathUp: app.assetsPath.hitUp,
        pathDown: app.assetsPath.hitDown,
        action: BlackjackPanelAction.hit)
  ];
}

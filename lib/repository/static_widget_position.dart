import 'package:app/model/widget_position.dart';
import 'package:app/utils/app.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';

class StaticWidgetPosition {
  static App app = App();
  static double zero = 0.0;
  static List<WidgetPosition> widgets = [
    WidgetPosition(
        id: Positions.deck,
        top: 0,
        right: -8,
        heightImage: 0.2,
        widthImage: 0.2,
        path: app.assetsPath.homeScreenDeck),
    WidgetPosition(
        id: Positions.deckAux,
        top: 0.03,
        left: 0.035,
        heightImage: 0.11,
        widthImage: 0.11,
        path: app.assetsPath.homeScreenDeckAux),
    WidgetPosition(
        id: Positions.line,
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,
        heightImage: 0.015,
        path: app.assetsPath.lineHeader),
    WidgetPosition(
        id: Positions.logo,
        alignment: Alignment.topCenter,
        heightImage: 0.055,
        widthImage: 0.175,
        margin: CustomEdgeInsets(top: 0.03),
        path: app.assetsPath.logo,
        fit: BoxFit.cover),
    WidgetPosition(
        id: Positions.wood,
        top: 0.4,
        heightImage: 0.4,
        widthImage: 1,
        path: app.assetsPath.homeScreenWood),
    WidgetPosition(
        id: Positions.black,
        top: 0.6,
        heightImage: 0.4,
        widthImage: 1,
        path: app.assetsPath.homeScreenBlack),
    WidgetPosition(
        id: Positions.alert,
        alignment: Alignment.center,
        heightImage: 0.05,
        widthImage: 0.3,
        path: app.assetsPath.homeScreenInvite),
    WidgetPosition(
        id: Positions.settings,
        top: 0.87,
        right: 0.1,
        widthFactor: 0.85,
        heightFactor: 0.9,
        heightImage: 0.035,
        widthImage: 0.065,
        alignment: Alignment.center,
        path: app.assetsPath.homeScreenSettings),
    WidgetPosition(
        id: Positions.money,
        top: 0.82,
        left: 0.1,
        alignment: Alignment.centerLeft,
        padding: CustomEdgeInsets(left: 0.02, top: 0.0035),
        heightImage: 0.1,
        widthImage: 0.15,
        path: app.assetsPath.homeScreenMoney),
    WidgetPosition(
        id: Positions.sum,
        alignment: Alignment.center,
        heightWidget: 0.05,
        widthWidget: 0.1,
        background: app.colors.secondaryColorApp,
        fontSize: 48),
    WidgetPosition(
        id: Positions.chips,
        heightWidget: 0.1,
        widthWidget: 0.1,
        heightImage: 0.075,
        widthImage: 0.075),
    WidgetPosition(
        id: Positions.chipsArea, heightWidget: 0.175, widthWidget: 0.175),
    WidgetPosition(
        id: Positions.panel,
        top: 0.42,
        left: 0.375,
        heightWidget: 0.06,
        widthWidget: 0.25,
        heightImage: 0.03,
        widthImage: 0.06,
        background: app.colors.secondaryColorApp,
        fontSize: 16),
    WidgetPosition(
        id: Positions.play,
        top: 0.42,
        left: 0.375,
        heightWidget: 0.06,
        widthWidget: 0.25,
        heightImage: 0.03,
        widthImage: 0.06,
        background: app.colors.secondaryColorApp,
        fontSize: 16),
    WidgetPosition(
      id: Positions.cards,
      top: 0.135,
      heightWidget: 0.1,
      widthWidget: 0.07,
    ),
    WidgetPosition(
        id: Positions.scores,
        top: 0.25,
        left: 0.25,
        right: 0.25,
        heightWidget: 0.05,
        heightImage: 0.04,
        widthImage: 0.035,
        heightFactor: 0.0125,
        alignment: Alignment.topCenter,
        path: app.assetsPath.score,
        padding: CustomEdgeInsets(top: 0.125),
        background: app.colors.secondaryColorApp,
        fontSize: 0.0175),
  ];
}

double getOffsetCards(int index) {
  if (index >= 0 && index <= 6) {
    return 0.6 + 0.015 * index;
  } else {
    return 0.705;
  }
}

double getOffsetScore(int index) {
  if (index >= 1 && index <= 6) {
    return 0.770 + 0.015 * (index - 1);
  } else {
    return 0.776;
  }
}

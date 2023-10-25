enum BlackjackState { start, playing, inGame, over }

enum BlackjackAction { startGame, drawCard, endGame }

enum BlackjackPanelAction { clear, deal, stand, double, hit, split }

enum BlackjackResult { LeftWins, RightWins, Draw, BothBust }

extension BlackjackPanelActionExtension on BlackjackPanelAction {
  int get value {
    switch (this) {
      case BlackjackPanelAction.stand:
      case BlackjackPanelAction.hit:
        return 1;
      case BlackjackPanelAction.deal:
      case BlackjackPanelAction.double:
        return 2;
      default:
        return -1;
    }
  }
}

enum Positions {
  background,
  deck,
  deckAux,
  line,
  logo,
  wood,
  black,
  money,
  settings,
  panel,
  alert,
  sum,
  chips,
  chipsArea,
  play,
  scores,
  cards
}

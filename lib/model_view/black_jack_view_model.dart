import 'package:app/model/card_model.dart';
import 'package:app/model/deck_model.dart';
import 'package:flutter/material.dart';

enum BlackjackState { start, inGame, over }

enum BlackjackAction { startGame, drawCard, endGame }

class BlackjackViewModel with ChangeNotifier {
  final BlackjackState _currentState = BlackjackState.start;
  BlackjackState get currentState => _currentState;

  DeckModel? deck;

  int playerScore = 0;

  List<CardModel> playCards = [];

  BlackjackViewModel();

  void dispatch(BlackjackAction action) {
    switch (action) {
      case BlackjackAction.startGame:
        // Lógica para iniciar o jogo (chamar API para obter baralho)
        break;
      case BlackjackAction.drawCard:
        // Lógica para puxar uma carta (chamar API)
        break;
      case BlackjackAction.endGame:
        // Lógica para encerrar o jogo
        break;
    }
    notifyListeners();
  }
}

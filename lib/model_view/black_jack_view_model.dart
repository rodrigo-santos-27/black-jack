import 'package:app/model/card_model.dart';
import 'package:app/model/deck_model.dart';
import 'package:app/service/deck_service.dart';
import 'package:app/utils/app.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';

class BlackjackViewModel with ChangeNotifier {
  BlackjackState _currentState = BlackjackState.start;
  BlackjackState get currentState => _currentState;

  final DeckService deckService = DeckService();

  DeckModel? _currentDeck;
  DeckModel? get currentDeck => _currentDeck;

  int playerScore = 0;

  BlackjackViewModel();

  Future<void> createNewDeck() async {
    try {
      _currentDeck = await deckService.fetchNewDeck();
      getCards(2);
    } catch (e) {
      print('Error when try fetch new deck $e');
    }
  }

  Future<List<CardModel>> getCards(int count) async {
    List<CardModel> newCards = [];
    try {
      newCards = await deckService.drawCards(currentDeck!.deckId, count);
      _currentDeck!.addCards(newCards);
      _currentDeck!.updateRemaining(count); // Atualizar o 'remaining'
    } catch (e) {
      print('Error when trying to fetch new cards $e');
    }
    return newCards;
  }

  void dispatch(BlackjackAction action, BuildContext context) {
    switch (action) {
      case BlackjackAction.startGame:
        updateState(BlackjackState.playing);
        Navigator.of(context).pushReplacementNamed(EndPoints.blackjack);
        break;
      case BlackjackAction.drawCard:
        break;
      case BlackjackAction.endGame:
        Navigator.of(context).pushReplacementNamed(EndPoints.home);
        updateState(BlackjackState.over);
        break;
    }
  }

  void updateState(BlackjackState newState) {
    _currentState = newState;
    notifyListeners();
  }
}

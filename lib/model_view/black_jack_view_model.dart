import 'package:app/model/card_model.dart';
import 'package:app/model/deck_model.dart';
import 'package:app/service/deck_service.dart';
import 'package:app/utils/app.dart';
import 'package:app/utils/enums.dart';
import 'package:flutter/material.dart';

class BlackjackViewModel with ChangeNotifier {
  final DeckService deckService = DeckService();

  DeckModel? _currentDeck;
  DeckModel? get currentDeck => _currentDeck;

  int playerScore = 0;

  BlackjackState _currentState = BlackjackState.start;
  BlackjackState get currentState => _currentState;

  BlackjackViewModel();

  final List<CardModel> _leftCards = [];
  List<CardModel>? get leftCards => _leftCards;

  void addCardToLeftList(CardModel card) {
    _leftCards.add(card);
    notifyListeners();
  }

  void clearCardsFromLeftList() {
    _leftCards.clear();
    notifyListeners();
  }

  int get totalValueOfLeftCards {
    int total = 0;

    for (CardModel card in _leftCards) {
      if (card.value == 'ACE') {
        total += 10;
      } else if (['KING', 'QUEEN', 'JACK'].contains(card.value)) {
        total += 10;
      } else {
        total += int.tryParse(card.value) ?? 0;
      }
    }
    return total;
  }

  final List<CardModel> _rightCards = [];
  List<CardModel>? get rightCards => _rightCards;

  void addCardToRightList(CardModel card) {
    _rightCards.add(card);
    notifyListeners();
  }

  void clearCardsFromRightList() {
    _rightCards.clear();
    notifyListeners();
  }

  int get totalValueOfRightCards {
    int total = 0;

    for (CardModel card in _rightCards) {
      if (card.value == 'ACE') {
        total += 10;
      } else if (['KING', 'QUEEN', 'JACK'].contains(card.value)) {
        total += 10;
      } else {
        total += int.tryParse(card.value) ?? 0;
      }
    }
    return total;
  }

  Future<void> createNewDeck() async {
    try {
      _currentDeck = await deckService.fetchNewDeck();
    } catch (e) {
      print('Error when try fetch new deck $e');
    }
  }

  Future<void> getCards(BlackjackPanelAction action) async {
    List<CardModel> newCards = [];
    try {
      newCards = await deckService.drawCards(currentDeck!.deckId, action.value);

      _currentDeck!.addCards(newCards);
      _currentDeck!.updateRemaining(action.value);

      switch (action) {
        case BlackjackPanelAction.deal:
        case BlackjackPanelAction.double:
          addCardToLeftList(newCards.first);
          addCardToRightList(newCards.last);
          break;
        case BlackjackPanelAction.stand:
          addCardToLeftList(newCards.first);
          break;
        case BlackjackPanelAction.hit:
          addCardToRightList(newCards.last);
          break;
        default:
      }
    } catch (e) {
      print('Error when trying to fetch new cards $e');
    }
  }

  void dispatch(BlackjackAction action, BuildContext context) {
    switch (action) {
      case BlackjackAction.startGame:
        createNewDeck();
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

  BlackjackResult determineWinner() {
    int leftScore = totalValueOfLeftCards;
    int rightScore = totalValueOfRightCards;

    if (leftScore > 21 && rightScore > 21) {
      return BlackjackResult.BothBust;
    } else if (leftScore > 21) {
      return BlackjackResult.RightWins;
    } else if (rightScore > 21) {
      return BlackjackResult.LeftWins;
    } else if (leftScore > rightScore) {
      return BlackjackResult.LeftWins;
    } else if (rightScore > leftScore) {
      return BlackjackResult.RightWins;
    } else {
      return BlackjackResult.Draw;
    }
  }
}

import 'package:app/model/card_model.dart';

class DeckModel {
  final String deckId;
  int remaining;
  final bool shuffled;
  List<CardModel>? cards;

  DeckModel({
    required this.deckId,
    required this.remaining,
    required this.shuffled,
    this.cards,
  });

  void addCards(List<CardModel> newCards) {
    cards ??= [];
    cards!.addAll(newCards);
  }

  void updateRemaining(int count) {
    remaining -= count;
  }
}

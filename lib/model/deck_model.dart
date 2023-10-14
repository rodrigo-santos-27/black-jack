// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app/model/card_model.dart';
import 'package:flutter/foundation.dart';

class DeckModel {
  final List<CardModel> cards;
  final String deckId;
  DeckModel({
    required this.cards,
    required this.deckId,
  });

  DeckModel copyWith({
    List<CardModel>? cards,
    String? deckId,
  }) {
    return DeckModel(
      cards: cards ?? this.cards,
      deckId: deckId ?? this.deckId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cards': cards.map((x) => x.toMap()).toList(),
      'deckId': deckId,
    };
  }

  factory DeckModel.fromMap(Map<String, dynamic> map) {
    return DeckModel(
      cards: List<CardModel>.from(
        (map['cards'] as List<int>).map<CardModel>(
          (x) => CardModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      deckId: map['deckId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeckModel.fromJson(String source) =>
      DeckModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeckModel(cards: $cards, deckId: $deckId)';

  @override
  bool operator ==(covariant DeckModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.cards, cards) && other.deckId == deckId;
  }

  @override
  int get hashCode => cards.hashCode ^ deckId.hashCode;
}

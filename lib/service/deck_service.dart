import 'dart:convert';

import 'package:app/model/card_model.dart';
import 'package:app/model/deck_model.dart';
import 'package:http/http.dart' as http;

class DeckService {
  static final DeckService _singleton = DeckService._internal();

  final String baseUrl = "https://www.deckofcardsapi.com/api";

  factory DeckService() {
    return _singleton;
  }

  DeckService._internal();

  Future<DeckModel> fetchNewDeck() async {
    late DeckModel deckModel;
    final response =
        await http.get(Uri.parse("$baseUrl/deck/new/shuffle/?deck_count=1"));

    final responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      deckModel = DeckModel(
        deckId: responseJson['deck_id'],
        remaining: responseJson['remaining'],
        shuffled: responseJson['shuffled'],
      );
      return deckModel;
    } else {
      throw Exception('Failed to load deck');
    }
  }

  Future<List<CardModel>> drawCards(String deckId, int count) async {
    final response =
        await http.get(Uri.parse("$baseUrl/deck/$deckId/draw/?count=$count"));
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      List<CardModel> newCards = (responseJson['cards'] as List)
          .map((cardJson) => CardModel.fromJson(cardJson))
          .toList();
      return newCards;
    } else {
      throw Exception('Failed to draw card');
    }
  }
}

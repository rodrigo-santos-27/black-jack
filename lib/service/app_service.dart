// random_service.dart

import 'dart:math';

import 'package:app/model/bets_data.dart';

class AppService {
  double getRandomValue() {
    final random = Random();
    return random.nextDouble() * 25.0;
  }

  int sum(List<BetsData> betsData) {
    return betsData.fold(0, (prev, element) => prev + element.value);
  }
}

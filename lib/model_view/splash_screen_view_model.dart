import 'package:app/service/loading_simulator.dart';
import 'package:flutter/material.dart';

class SplashScreenViewModel extends ChangeNotifier {
  final loadingSimulator = LoadingSimulator();
  double _progress = 0.0;
  double get progress => _progress;

  bool _isComplete = false;
  bool get isComplete => _isComplete;

  void runSimulator() {
    loadingSimulator.startLoading().listen((progress) {
      _progress = progress;
      if (progress == 1.0) {
        _isComplete = true;
      }
      notifyListeners();
    });
  }
}

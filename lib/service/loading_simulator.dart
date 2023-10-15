import 'dart:async';

class LoadingSimulator {
  final Duration interval;
  final Duration totalDuration;

  late StreamController<double> _streamController;
  late Timer _timer;
  int _elapsedIntervals = 0;

  LoadingSimulator(
      {this.interval = const Duration(milliseconds: 100),
      this.totalDuration = const Duration(seconds: 10)});

  Stream<double> startLoading() {
    _streamController = StreamController<double>();

    _timer = Timer.periodic(interval, (timer) {
      _elapsedIntervals++;
      double progress = _elapsedIntervals *
          interval.inMilliseconds /
          totalDuration.inMilliseconds;

      _streamController.add(progress);

      if (progress >= 1.0) {
        _stopLoading();
      }
    });

    return _streamController.stream;
  }

  void _stopLoading() {
    _timer.cancel();
    _streamController.close();
  }
}

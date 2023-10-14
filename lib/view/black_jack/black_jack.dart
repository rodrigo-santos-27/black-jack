import 'package:app/model_view/black_jack_view_model.dart';
import 'package:app/view/start_screen/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlackjackView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BlackjackViewModel>(
      builder: (context, viewModel, child) {
        switch (viewModel.currentState) {
          case BlackjackState.start:
            return const StartScreen();
          case BlackjackState.inGame:
            return Container();
          case BlackjackState.over:
            return Container();
          default:
            return Container();
        }
      },
    );
  }
}

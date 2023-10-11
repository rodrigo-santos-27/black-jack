import 'package:app/utils/app.dart';
import 'package:flutter/material.dart';

class HomeBottom extends StatelessWidget {
  const HomeBottom({super.key});
  @override
  Widget build(BuildContext context) {
    App app = App();
    final double widthWidget = MediaQuery.of(context).size.width;
    final double heightWidget = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          height: widthWidget * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(app.assetsPath.homeScreenWood),
                fit: BoxFit.cover),
          ),
        )
      ],
    );
  }
}

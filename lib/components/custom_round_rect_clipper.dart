import 'package:flutter/material.dart';

class CustomRoundedRectClipper extends CustomClipper<Path> {
  final double widthFactor;
  final double heightFactor;
  final double borderRadius;

  CustomRoundedRectClipper({
    required this.widthFactor,
    required this.heightFactor,
    this.borderRadius = 30.0,
  });

  @override
  Path getClip(Size size) {
    var rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width * widthFactor,
      height: size.height * heightFactor,
    );
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(borderRadius)));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

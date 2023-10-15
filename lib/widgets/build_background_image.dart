import 'package:app/components/image_size.dart';
import 'package:flutter/material.dart';

class BuildBackgroundImage extends StatelessWidget {
  const BuildBackgroundImage({super.key, required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return ImageSize(imagePath: path, fit: BoxFit.cover);
  }
}

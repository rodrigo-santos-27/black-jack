import 'package:flutter/material.dart';

class ImageSize extends StatelessWidget {
  const ImageSize(
      {super.key,
      this.height,
      this.width,
      this.imagePath,
      this.fit,
      this.child,
      this.alignment,
      this.margin,
      this.padding});
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final String? imagePath;
  final BoxFit? fit;
  final Widget? child;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: alignment,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath ?? ''), fit: fit),
      ),
      child: child,
    );
  }
}

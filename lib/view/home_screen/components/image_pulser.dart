import 'package:flutter/material.dart';

class ImagePulser extends StatefulWidget {
  const ImagePulser(
      {super.key,
      required this.onTap,
      required this.image,
      required this.heightWidget,
      required this.widthWidget,
      required this.offSet,
      this.glow,
      this.onHover,
      required this.glowActive,
      required this.animationController,
      required this.animation});

  final GestureTapCallback onTap;
  final Function(bool hover)? onHover;
  final Widget image;
  final double heightWidget;
  final double widthWidget;
  final double offSet;
  final Color? glow;
  final bool glowActive;
  final AnimationController animationController;
  final Animation animation;
  @override
  State<ImagePulser> createState() => _ImagePulserState();
}

class _ImagePulserState extends State<ImagePulser>
    with SingleTickerProviderStateMixin {
  late List<AnimationController> animationControllers = [];
  late List<Animation> animations = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: widget.animation,
          builder: (context, _) {
            return Container(
              height: widget.heightWidget - widget.offSet,
              width: widget.widthWidget - widget.offSet,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white
                        .withOpacity(widget.animationController.value / 2),
                    spreadRadius: 8,
                    blurRadius: 8,
                  ),
                  BoxShadow(
                    color: widget.glow == null
                        ? Colors.white
                            .withOpacity(widget.animationController.value / 2)
                        : widget.glow!
                            .withOpacity(widget.animationController.value / 2),
                    spreadRadius: 12,
                    blurRadius: 12,
                  )
                ],
              ),
            );
          },
        ),
        ClipOval(
          child: InkWell(
            onTap: widget.onTap,
            onHover: widget.onHover,
            child: widget.image,
          ),
        ),
      ],
    );
  }
}

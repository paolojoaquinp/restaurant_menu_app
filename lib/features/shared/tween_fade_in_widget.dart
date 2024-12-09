import 'package:flutter/material.dart';

class TweenAnimatedFadeWidget extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final bool isVisible;
  final Curve curve;
  final double initialOpacity;
  final double finalOpacity;

  const TweenAnimatedFadeWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.isVisible = true,
    this.curve = Curves.easeInOut,
    this.initialOpacity = 0.0,
    this.finalOpacity = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      tween: Tween<double>(
        begin: isVisible ? initialOpacity : finalOpacity,
        end: isVisible ? finalOpacity : initialOpacity,
      ),
      curve: curve,
      builder: (context, opacity, child) {
        return AnimatedOpacity(
          opacity: opacity,
          duration: duration,
          child: child,
        );
      },
      child: child,
    );
  }
}
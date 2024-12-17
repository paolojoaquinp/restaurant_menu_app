import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/features/home_screen/domain/entities/food_menu.dart';

class TransformedImage extends StatelessWidget {
  const TransformedImage({
    super.key,
    required this.foodMenu,
    required this.factorChange,
    required this.rotateEndX,
    required this.rotateStartX,
  });

  final MealFood foodMenu;
  final double factorChange;
  final double rotateEndX;
  final double rotateStartX;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -25,
      right: lerpDouble(rotateStartX, rotateEndX, factorChange)!,
      child: Transform.rotate(
        angle: lerpDouble(0, -2 * pi, factorChange)!,
        child: Image.asset(
          foodMenu.image,
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

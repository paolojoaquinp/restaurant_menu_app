import 'dart:math';

import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/features/home_screen/domain/entities/food_menu.dart';

class CardTest extends StatelessWidget {
  const CardTest({
    super.key,
    required this.index,
    this.foodMenu,
  });

  final int index;
  final FoodMenu? foodMenu;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 35,
                left: -50.0,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    foodMenu!.name,
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.25),
                        fontSize: 118.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                right: -85.0,
                top: -70.0,
                child: Image.asset(
                  foodMenu!.image ?? 'https://picsum.photos/250?image=9',
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(42.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodMenu!.name,
                        style: TextStyle(
                          fontSize: 24.0,
                          letterSpacing: -1.0,
                          height: 0.0,
                        ),
                      ),
                      SizedBox(height: 21,),
                      Text(
                        'NUMBER OF MEALS',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        foodMenu!.cantMeals.toString(),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

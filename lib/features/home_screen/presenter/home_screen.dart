import 'dart:math';

import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/features/home_screen/presenter/widgets/card_test.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Transform.translate(
              offset: Offset(0, -400.0*index),
              child: Transform(
                transform: Matrix4.identity()..rotateZ(-pi/(12+index)),
                child: SizedBox(
                  height: 500,
                  width: 300,
                  child: CardTest(index: index),
                ),
              ),
            );
          }),
    );
  }
}

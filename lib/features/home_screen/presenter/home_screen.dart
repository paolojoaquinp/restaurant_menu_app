
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/features/home_screen/presenter/widgets/card_test.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          color: Colors.pink,
          height: 400,
          child: Stack(
            children: [
              Positioned.fill(
                child: Transform.translate(
                  offset: Offset(0, -250),
                  child: _PerspectiveListView()
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PerspectiveListView extends StatelessWidget {
  final _pageController = PageController(viewportFraction: 0.6, initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        return Stack(
          fit: StackFit.expand,
          children: [
            ...List.generate(7, (index) {
              return Transform(
                origin: Offset(width, 0.0),
                transform: Matrix4.identity()
                  ..translate(0.0,
                    // lerpDouble(0.0, 100.0, 0.0)!
                    50.0*(index)
                  ,)
                  ..rotateZ(-pi/(8.0-(index*0.6))),
                child: CardTest(index: index));
              })
            ]
        );
      },
    );
  }
}

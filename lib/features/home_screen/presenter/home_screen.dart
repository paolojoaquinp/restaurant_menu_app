import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/features/home_screen/presenter/widgets/card_test.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double currentValue = 0.0;
  final int lengthItems = 10;
  double percentPage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            ...List.generate(
              lengthItems - 1,
              (index) {
                return _TransformedCard(
                  factorChange: currentValue,
                  index: index,
                  child: CardTest(index: index),
                );
              },
            ),
            // Animated Container appearance with opacity
            Positioned(
              bottom: lerpDouble(-150, 0, currentValue), // FINAL TIME
              left: 130,
              child: Transform.rotate(
                angle: -pi / lerpDouble(3,10,currentValue)!,
                child: Opacity(
                  opacity: currentValue,
                  child: Container(
                    color: Colors.red,
                    width: 300,
                    height: 500,
                  ),
                ),
              ),
            ),
            //
            Positioned(
              top: 260,
              left: 130,
              child: Container(
                width: 300,
                height: 500,
                child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    clipBehavior: Clip.none,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Transform.rotate(
                        angle: -pi / (10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              width: 1.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Slider(
                value: currentValue,
                onChanged: (value) {
                  currentValue = value;
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }
}

class _TransformedCard extends StatelessWidget {
  const _TransformedCard({
    super.key,
    required this.index,
    required this.child,
    required this.factorChange,
  });

  final int index;
  final Widget child;
  final double factorChange;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ((index+1)-factorChange) * 40,
      right: 50.0 + (index * 20),
      child: Transform.translate(
        offset: Offset(250, -100.0),
        child: Transform.rotate(
          angle: -pi / 10,
          child: SizedBox(
            height: 500,
            width: 280,
            child: child,
          ),
        ),
      ),
    );
  }
}

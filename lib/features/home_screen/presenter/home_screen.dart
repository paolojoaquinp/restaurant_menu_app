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

  PageController? _pageController;
  int? _currentIndex;
  double? _pagePercent;

  @override
  void initState() {
    _currentIndex = lengthItems-1;
    _pageController = PageController(
      initialPage: _currentIndex!,
    );
    _pagePercent = 0.0;
    _pageController!.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!
      ..removeListener(_pageListener)
      ..dispose();
    super.dispose();
  }

  void _pageListener() {
    _currentIndex = _pageController!.page!.floor();
    _pagePercent = (_pageController!.page! - _currentIndex!).abs();
    print('Page percent: $_pagePercent');
    print('Current index $_currentIndex');
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    print(_currentIndex);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
          clipBehavior: Clip.none,
          children: [
            ...List.generate(
              lengthItems,
              (index) {
                return _TransformedCard(
                  factorChange:1- _pagePercent!,
                  index: index,
                  child: CardTest(index: index),
                );
              },
            ),
            // Animated Container appearance with opacity
            Positioned(
              bottom: lerpDouble(-150, 0, 1-_pagePercent!), // FINAL TIME
              left: 130,
              child: Transform.rotate(
                angle: -pi / lerpDouble(3,10,1-_pagePercent!)!,
                child: Opacity(
                  opacity:1-_pagePercent!,
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
                  controller: _pageController,
                    scrollDirection: Axis.vertical,
                    clipBehavior: Clip.none,
                    itemCount: 10,
                    reverse: true,
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
            // Slider(
            //     value: currentValue,
            //     onChanged: (value) {
            //       currentValue = value;
            //       setState(() {});
            //     }),
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

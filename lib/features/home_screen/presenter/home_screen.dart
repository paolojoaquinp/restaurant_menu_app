import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.9);

  final List<String> cardPaths = [
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hand of Cards - PageView")),
        body: Container(
            width: double.infinity,
            height: 300,
            child: Swiper(
              axisDirection: AxisDirection.right,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  cardPaths[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount:cardPaths.length,
              itemWidth: 300.0,
              layout: SwiperLayout.STACK,
            )));
  }

  Widget _buildCard(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        // Obtenemos la posición relativa de la página
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          value = (1 - value.abs()).clamp(0.0, 1.0);
        }
        final double angle = (1 - value) * 0.5; // Rotación
        final double scale = 0.8 + (value * 0.2); // Escala

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..scale(scale)
            ..rotateZ(0), // Alterna dirección
          child: Container(
            width: 500,
            height: 500,
            child: Image.network(
              cardPaths[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

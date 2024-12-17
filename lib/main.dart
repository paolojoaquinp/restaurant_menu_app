import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/features/detail_food_meal/presenter/detail_food_meal_screen.dart';
import 'package:restaurant_menu_app/features/home_screen/presenter/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

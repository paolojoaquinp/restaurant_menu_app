
import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/features/detail_food_meal/presenter/widgets/custom_app_bar.dart';
import 'package:restaurant_menu_app/features/detail_food_meal/presenter/widgets/food_page_view_item.dart';
import 'package:restaurant_menu_app/features/home_screen/domain/entities/food_menu.dart';

class DetailFoodMealScreen extends StatelessWidget {
  const DetailFoodMealScreen({
    super.key,
    required this.foodMenu,
    required this.index,
  });

  final FoodMenu foodMenu;
  final int index;

  @override
  Widget build(BuildContext context) {
    return _Page(index: index, foodMenu: foodMenu);
  }
}

class _Page extends StatefulWidget {
  const _Page({
    super.key,
    required this.index,
    required this.foodMenu,
  });

  final int index;
  final FoodMenu foodMenu;

  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {
  PageController? _pageController;
  int? _currentIndex;
  double? _pagePercent;

  @override
  void initState() {
    _currentIndex = 0;
    _pageController = PageController(initialPage: 0);
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.index,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: kToolbarHeight,
                ),
                CustomAppBar(),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            PageView.builder(
              controller: _pageController,
              clipBehavior: Clip.none,
              itemCount: widget.foodMenu.mealFoods!.length,
              itemBuilder: (context, index) {
                return FoodPageViewItem(
                  index: index,
                  foodMenu: widget.foodMenu.mealFoods![index],
                  rotateStartX: _currentIndex == index ? -50.0 : 50.0,
                  rotateEndX: _currentIndex == index ? 50.0 : -50.0,
                  factorChange: _pagePercent!,
                  // factorChange: _currentIndex == index
                  //   ? _pagePercent!
                  //   : 0.0
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
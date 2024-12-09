import 'package:flutter/material.dart';
import 'package:restaurant_menu_app/features/detail_food_meal/presenter/widgets/custom_app_bar.dart';
import 'package:restaurant_menu_app/features/detail_food_meal/presenter/widgets/nutrition_label_widget.dart';
import 'package:restaurant_menu_app/features/detail_food_meal/presenter/widgets/pricing_checkbox_item.dart';
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
                const Expanded(child: SizedBox(),),
              ],
            ),
            PageView.builder(
              controller: _pageController,
              clipBehavior: Clip.none,
              itemCount: widget.foodMenu.mealFoods?.length ?? 0,
              itemBuilder: (context, index) {
                return FoodPageViewItem(
                  index: index,
                  foodMenu: widget.foodMenu.mealFoods![index],
                  factorChange:_pagePercent!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FoodPageViewItem extends StatelessWidget {
  const FoodPageViewItem({
    super.key,
    required this.index,
    required this.foodMenu,
    required this.factorChange,
  });

  final int index;
  final MealFood foodMenu;
  final double factorChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: Column(
        children: [
          const SizedBox(
            height: kToolbarHeight * 2,
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                _TransformedImage(foodMenu: foodMenu, factorChange: factorChange),
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NutritionLabelWidget(
                              label: 'RATING',
                              value: '4.2',
                              icon: Icon(
                                Icons.star,
                                color: Colors.green,
                                size: 18.0,
                              ),
                            ),
                            NutritionLabelWidget(
                              label: 'Calories',
                              value: '300 kcal',
                            ),
                            NutritionLabelWidget(
                              label: 'Weight',
                              value: '420 g',
                            ),
                            NutritionLabelWidget(
                              label: 'Allergens',
                              value: '1, 3, 12',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add extras',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            const PricingCheckboxItem(
                                label: 'Parmesan Cheese', price: '+\$0.50'),
                            const PricingCheckboxItem(
                                label: 'Chilli Oil', price: '+\$0.00'),
                            const PricingCheckboxItem(
                                label: 'Truffle Oil', price: '+\$0.00'),
                            const SizedBox(
                              height: 28.0,
                            ),
                            Container(
                              child: DefaultTabController(
                                length: 3,
                                child: TabBar(
                                  isScrollable: true,
                                  tabAlignment: TabAlignment.start,
                                  labelPadding:
                                      const EdgeInsets.only(right: 20),
                                  labelStyle:
                                      Theme.of(context).textTheme.titleLarge,
                                  labelColor: Colors.grey[400],
                                  unselectedLabelColor: Colors.grey[300],
                                  dividerColor: Colors.transparent,
                                  indicatorColor: Colors.grey[300],
                                  overlayColor:
                                      WidgetStatePropertyAll(Colors.grey[100]),
                                  tabs: [
                                    const Tab(
                                      text: 'Details',
                                    ),
                                    const Tab(
                                      text: 'Nutritional value',
                                    ),
                                    const Tab(
                                      text: 'All',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Spaghetti fusilli',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      Text(
                                        '\$9.60',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.green,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TransformedImage extends StatelessWidget {
  const _TransformedImage({
    super.key,
    required this.foodMenu,
    required this.factorChange,
  });

  final MealFood foodMenu;
  final double factorChange;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -25,
      right: -50,
      child: Image.asset(
        foodMenu.image,
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}

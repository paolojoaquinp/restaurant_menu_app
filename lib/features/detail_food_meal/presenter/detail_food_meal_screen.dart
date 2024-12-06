import 'dart:math';

import 'package:flutter/material.dart';
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
    return Hero(
      tag: index,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: kToolbarHeight,
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: kToolbarHeight,
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        const BackButton(),
                        Text(
                          "Pasta",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 28.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '1',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '/16',
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                              height: 2.0,
                              letterSpacing: 1.5),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -25,
                    right: -50,
                    child: Image.asset(
                            foodMenu.image,
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                  ),
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
      ),
    );
  }
}

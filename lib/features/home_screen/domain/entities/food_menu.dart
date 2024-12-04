class MealFood {
  const MealFood({
    required this.index,
    required this.name,
    required this.image,
  });

  final String index;
  final String name;
  final String image;
}

class FoodMenu {
  const FoodMenu({
    required this.name,
    required this.descrition,
    required this.image,
    required this.category,
    required this.cantMeals,
    this.mealFoods,
  });

  final String name;
  final String descrition;
  final String image;
  final String category;
  final int cantMeals;
  final List<MealFood>? mealFoods;

  static final List<FoodMenu> fakeFoodMenuValues = [
    const FoodMenu(
      name: 'Pizzas',
      descrition: 'descrition 0',
      image: 'assets/pizza.png',
      category: 'pizzas',
      cantMeals: 28,
    ),
    const FoodMenu(
      name: 'Eggs',
      descrition: 'descrition 0',
      image: 'assets/eggs.png',
      category: 'eggs',
      cantMeals: 20,
    ),
    const FoodMenu(
      name: 'Pizzas',
      descrition: 'descrition 0',
      image: 'assets/pizza.png',
      category: 'pizzas',
      cantMeals: 28,
    ),
    const FoodMenu(
      name: 'Eggs',
      descrition: 'descrition 0',
      image: 'assets/eggs.png',
      category: 'eggs',
      cantMeals: 20,
    ),
    const FoodMenu(
      name: 'Pizzas',
      descrition: 'descrition 0',
      image: 'assets/pizza.png',
      category: 'pizzas',
      cantMeals: 28,
    ),
    const FoodMenu(
      name: 'Eggs',
      descrition: 'descrition 0',
      image: 'assets/eggs.png',
      category: 'eggs',
      cantMeals: 20,
    ),
    /* BEGIN */
    const FoodMenu(
      name: 'Salads',
      descrition: 'descrition 0',
      image: 'assets/salads.png',
      category: 'salads',
      cantMeals: 48,
    ),
    FoodMenu(
      name: 'Pasta',
      descrition: 'descrition 0',
      image: 'assets/pasta-0.png',
      category: 'pasta',
      cantMeals: 16,
      mealFoods: List.generate(
        3,
        (index) => MealFood(
          index: '$index',
          name: 'Spaghetti fusilli',
          image: 'assets/pasta-$index.png',
        ),
      ),
    ),
    const FoodMenu(
      name: 'Pizzas',
      descrition: 'descrition 0',
      image: 'assets/pizza.png',
      category: 'pizzas',
      cantMeals: 28,
    ),
    const FoodMenu(
      name: 'Eggs',
      descrition: 'descrition 0',
      image: 'assets/eggs.png',
      category: 'eggs',
      cantMeals: 20,
    ),
  ];
}

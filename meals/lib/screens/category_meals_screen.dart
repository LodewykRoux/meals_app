import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/widget/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> meals;
  final void Function()? toggleFavorite;
  static const routeName = '/category-meals';

  const CategoryMealsScreen(
      {Key? key, required this.meals, this.toggleFavorite})
      : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title']!;
    final categoryId = routeArgs['id'];
    displayedMeals = widget.meals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(
          title: displayedMeals[index].title,
          imageURL: displayedMeals[index].imageUrl,
          duration: displayedMeals[index].duration,
          affordability: displayedMeals[index].affordability,
          complexity: displayedMeals[index].complexity,
          selectMeal: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) => MealDetailScreen(
                meal: displayedMeals[index],
                favoriteMeal: widget.toggleFavorite,
              ),
            ))
                .then((result) {
              if (result != null) {
                _removeMeal(result);
              }
            });
          },
        ),
        itemCount: displayedMeals.length,
      ),
    );
    ;
  }
}

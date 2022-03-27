import 'package:flutter/material.dart';
import 'package:meals/dummydata/dummy_data.dart';
import 'package:meals/widget/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMealsScreen(
  //     {Key? key, required this.categoryId, required this.categoryTitle})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(
          title: categoryMeals[index].title,
          imageURL: categoryMeals[index].imageUrl,
          duration: categoryMeals[index].duration,
          affordability: categoryMeals[index].affordability,
          complexity: categoryMeals[index].complexity,
          selectMeal: () {},
        ),
        itemCount: categoryMeals.length,
      ),
    );
    ;
  }
}

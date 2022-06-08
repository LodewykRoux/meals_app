import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal>? favoriteMeals;
  const FavoritesScreen({Key? key, this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('You have no favorites yet - start adding some!'),
    );
  }
}

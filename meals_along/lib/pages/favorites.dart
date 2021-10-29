import "package:flutter/material.dart";
import 'package:meals/classes/meal.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesPage({required this.favoriteMeals, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("favorites"));
  }
}

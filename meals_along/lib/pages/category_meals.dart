import "package:flutter/material.dart";
import 'package:meals/classes/meal.dart';
import 'package:meals/components/meals/meal_item.dart';

class CategoryMealsPage extends StatelessWidget {
/*
  final String categoryId;
  final String categoryTitle;

  const CategoryMealsPage(
      {Key? key, required this.categoryId, required this.categoryTitle})
      : super(key: key);
*/

  final List<Meal> filteredMeals;
  const CategoryMealsPage(this.filteredMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs["title"] as String;
    final categoryId = routeArgs["id"] as String;
    final categoryMeals = filteredMeals
        .where((meal) => meal.categoryIds.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, i) => MealItem(
            mealId: categoryMeals[i].id,
            title: categoryMeals[i].title,
            imageUrl: categoryMeals[i].imageUrl,
            duration: categoryMeals[i].duration,
            complexity: categoryMeals[i].complexity,
            affordability: categoryMeals[i].affordability),
      ),
    );
  }
}

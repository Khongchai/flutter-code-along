import "package:collection/collection.dart";
import 'package:flutter/material.dart';
import 'package:meals/classes/meal.dart';
import 'package:meals/classes/routes.dart';
import 'package:meals/pages/filters.dart';
import 'package:meals/pages/meal_detail.dart';
import 'package:meals/pages/tabs.dart';

import 'classes/filter_type.dart';
import 'dummy_data.dart';
import 'pages/categories.dart';
import 'pages/category_meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FilterType _filters = FilterType(
      glutenFree: false, lactoseFree: false, vegan: false, vegetarian: false);
  final List<Meal> _favoriteMeals = [];

  void _setFilters(FilterType filters) {
    setState(() {
      _filters = filters;
    });
  }

  void _addMealToFavorite(String mealId) {
    final Meal? mealToBeFavorited =
        _favoriteMeals.firstWhereOrNull((meal) => meal.id == mealId);
    if (mealToBeFavorited != null) {
      setState(() {
        _favoriteMeals.add(mealToBeFavorited);
      });
    } else {
      setState(() {
        _favoriteMeals.remove(mealToBeFavorited);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _filteredMeals = dummyMeals
        .where((meal) =>
            meal.isLactoseFree == _filters.lactoseFree &&
            meal.isVegan == _filters.vegan &&
            meal.isVegetarian == _filters.vegetarian &&
            meal.isGlutenFree == _filters.glutenFree)
        .toList();

    return MaterialApp(
        title: "Khong's Cuisine",
        theme: ThemeData(
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(secondary: Colors.amber, primary: Colors.pink),
            canvasColor: const Color.fromRGBO(255, 254, 229, 1),
            fontFamily: "Raleway",
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                caption: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: "RobotoCondensed",
                    fontWeight: FontWeight.bold))),
        home: TabsScreen(
          favoriteMeals: _favoriteMeals,
        ),
        routes: {
          const Routes.categoryMeals().route: (ctx) =>
              CategoryMealsPage(_filteredMeals),
          const Routes.mealDetail().route: (ctx) => const MealDetail(),
          const Routes.filters().route: (ctx) => Filters(_setFilters, _filters),
        },
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (ctx) => const CategoriesPage()));
  }
}

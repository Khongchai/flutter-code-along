import 'package:flutter/material.dart';
import 'package:meals/classes/routes.dart';
import 'package:meals/pages/meal_detail.dart';

import 'pages/categories.dart';
import 'pages/category_meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Khong's Cuisine",
        theme: ThemeData(
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(secondary: Colors.amber, primary: Colors.pink),
            canvasColor: const Color.fromRGBO(255, 254, 229, 1),
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
        home: const CategoriesPage(),
        routes: {
          const Routes.categoryMeals().route: (ctx) =>
              const CategoryMealsPage(),
          const Routes.mealDetail().route: (ctx) => const MealDetail(),
        },
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (ctx) => const CategoriesPage()));
  }
}

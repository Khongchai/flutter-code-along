import "package:flutter/material.dart";
import 'package:meals/components/shared/header_with_item_list.dart';
import 'package:meals/components/shared/space.dart';
import 'package:meals/components/shared/text_listtile.dart';
import 'package:meals/dummy_data.dart';

import "../components/shared/textcard.dart";

class MealDetail extends StatelessWidget {
  const MealDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: Column(children: [
        SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover)),
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              const Space(20),
              StyledHeaderWithItemList(
                  headerText: "Ingredients",
                  widgets: selectedMeal.ingredients
                      .map((ingredient) => TextCard(ingredient))
                      .toList()),
              const Space(20),
              StyledHeaderWithItemList(
                  headerText: "Steps",
                  widgets: selectedMeal.steps
                      .asMap()
                      .map((i, step) => MapEntry(
                          i,
                          TextListTile(
                            contentText: step,
                            leadingText: "${i + 1}",
                          )))
                      .values
                      .toList()),
              const Space(20),
            ],
          )),
        ),
      ]),
    );
  }
}

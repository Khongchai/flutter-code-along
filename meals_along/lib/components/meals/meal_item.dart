import "package:flutter/material.dart";
import 'package:meals/classes/meal.dart';
import 'package:meals/classes/routes.dart';

class MealItem extends StatelessWidget {
  final String mealId;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {Key? key,
      required this.mealId,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability})
      : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(const Routes.mealDetail().route, arguments: mealId);
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Luxurious";
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imageUrl,
                      height: 250, width: 1 / 0, fit: BoxFit.cover)),
              Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    width: 260,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontFamily: "Raleway"),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(children: [
                  const Icon(Icons.schedule),
                  const SizedBox(width: 6),
                  Text("$duration min")
                ]),
                Row(children: [
                  const Icon(Icons.work),
                  const SizedBox(width: 6),
                  Text(complexityText)
                ]),
                Row(children: [
                  const Icon(Icons.attach_money),
                  const SizedBox(width: 6),
                  Text(affordabilityText)
                ]),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

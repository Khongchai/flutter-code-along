import "package:flutter/material.dart";
import 'package:meals/classes/routes.dart';
import 'package:meals/components/drawer/drawer_item.dart';

import "../components/shared/space.dart";

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  void _replaceCurrentPage(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: 1 / 0,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.secondary,
          child: const Text("Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.black,
              )),
        ),
        const Space(20),
        DrawerItem(
          onTap: () => _replaceCurrentPage(context, "/"),
          icon: Icons.restaurant,
          title: "Meals",
        ),
        DrawerItem(
          onTap: () =>
              _replaceCurrentPage(context, const Routes.filters().route),
          icon: Icons.favorite,
          title: "Filters",
        ),
      ],
    ));
  }
}

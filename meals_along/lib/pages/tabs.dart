import "package:flutter/material.dart";
import 'package:meals/classes/meal.dart';
import 'package:meals/pages/favorites.dart';

import 'categories.dart';
import 'main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;
  var _pages = [];

  _updateSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        "label": "Categories",
        "page": const CategoriesPage(),
        "icon": const Icon(Icons.category)
      },
      {
        "label": "Favorites",
        "page": FavoritesPage(
          favoriteMeals: widget.favoriteMeals,
        ),
        "icon": const Icon(Icons.favorite)
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(title: Text(_pages[selectedIndex]["label"] as String)),
      body: _pages[selectedIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: _updateSelection,
          items: _pages
              .map((page) => BottomNavigationBarItem(
                  icon: page["icon"] as Icon, label: page["label"] as String))
              .toList()),
    );
  }
}

/*
top tabbar
return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: const Text("Khong's Cuisine"),
              bottom: const TabBar(tabs: [
                Tab(icon: Icon(Icons.category), text: "Categories"),
                Tab(icon: Icon(Icons.star), text: "Favorites"),
                //The amount TabBarView children should match the
                //amount of tabs specified above.
                //The order should also match.
              ])),
          body: const TabBarView(children: [CategoriesPage(), FavoritesPage()]),
        ));
 */

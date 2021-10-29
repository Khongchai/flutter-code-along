import "package:flutter/material.dart";
import 'package:meals/classes/filter_type.dart';

import "../components/filters/switch.dart";
import 'main_drawer.dart';

class Filters extends StatefulWidget {
  final Function(FilterType) setFilters;
  final FilterType filters;

  const Filters(this.setFilters, this.filters, {Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Filters"),
        ),
        drawer: const MainDrawer(),
        body: Column(children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: Text("Adjust your meal selection.",
                  style: Theme.of(context).textTheme.caption)),
          Expanded(
              child: ListView(children: [
            CustomSwitch(
              title: "Vegetarian",
              onChanged: () {
                /*
                 probably not the very best practice...
                 */
                widget.filters.vegetarian = !widget.filters.vegetarian;
                widget.setFilters(widget.filters);
              },
              switchState: widget.filters.vegetarian,
            ),
            CustomSwitch(
              title: "Vegan",
              onChanged: () {
                widget.filters.vegan = !widget.filters.vegan;
                widget.setFilters(widget.filters);
              },
              switchState: widget.filters.vegan,
            ),
            CustomSwitch(
              title: "Lactose Free",
              onChanged: () {
                widget.filters.lactoseFree = !widget.filters.lactoseFree;
                widget.setFilters(widget.filters);
              },
              switchState: widget.filters.lactoseFree,
            ),
            CustomSwitch(
              title: "Gluten Free",
              onChanged: () {
                widget.filters.glutenFree = !widget.filters.glutenFree;
                widget.setFilters(widget.filters);
              },
              switchState: widget.filters.glutenFree,
            ),
          ])),
        ]));
  }
}

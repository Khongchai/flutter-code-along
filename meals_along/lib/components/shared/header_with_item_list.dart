import "package:flutter/material.dart";

class StyledHeaderWithItemList extends StatelessWidget {
  final String headerText;
  final List<Widget> widgets;

  const StyledHeaderWithItemList(
      {Key? key, required this.headerText, required this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(headerText, style: Theme.of(context).textTheme.caption),
      Column(children: widgets)
    ]);
  }
}

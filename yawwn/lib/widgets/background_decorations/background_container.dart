import "package:flutter/material.dart";

class BackgroundContainer extends StatelessWidget {
  final List<Widget> children;
  const BackgroundContainer({required this.children, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
        child: Stack(children: children));
  }
}

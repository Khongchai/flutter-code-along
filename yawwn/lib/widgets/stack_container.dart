import "package:flutter/material.dart";
import 'package:yawwn/constants/colors.dart';

class StackContainer extends StatelessWidget {
  final List<Widget> children;

  const StackContainer({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1 / 0,
        decoration: BoxDecoration(
          color: appColors.background,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Stack(children: children),
        ));
  }
}

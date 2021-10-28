import "package:flutter/material.dart";

class Space extends StatelessWidget {
  final double space;
  const Space(this.space, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}

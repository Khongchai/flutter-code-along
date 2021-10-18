import 'package:flutter/material.dart';

class EndingSection extends StatelessWidget {
  final String text;
  final int score;
  final VoidCallback restartFunction;

  const EndingSection(
      {Key? key,
      required this.text,
      required this.score,
      required this.restartFunction})
      : super(key: key);

  //Using get is like python's @property decorator
  //You can now access this function like it's a property -- without the ().
  String get getText => text + "\nDein Spielstand ist $score";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            child: Align(
              child: Text(
                getText,
                textAlign: TextAlign.center,
              ),
              alignment: Alignment.topCenter,
            ),
            padding: EdgeInsets.all(20)),
        OutlinedButton(
          child: Text("Neustarten"),
          onPressed: restartFunction,
        )
      ],
    );
  }
}

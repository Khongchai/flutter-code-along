import "package:flutter/material.dart";

class Answers extends StatelessWidget {
  final Function onPressed;
  final List<Map<String, int>> answers;

  const Answers({Key? key, required this.onPressed, required this.answers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 10, runSpacing: 0, children: [
      ...answers.asMap().entries.map((entry) => Container(
          child: OutlinedButton(
            child: Text("Answer button"),
            onPressed: () => onPressed(0),
          ),
          margin: const EdgeInsets.all(0))),
    ]);
  }
}

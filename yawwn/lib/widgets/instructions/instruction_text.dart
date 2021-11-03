import "package:flutter/material.dart";

class InstructionText extends StatelessWidget {
  final String text;
  const InstructionText(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset(
        "assets/decor/sheep.png",
        width: 30,
      ),
      const SizedBox(height: 10, width: 10),
      Expanded(child: Text(text))
    ]);
  }
}

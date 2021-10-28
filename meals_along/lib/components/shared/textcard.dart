import "package:flutter/material.dart";

class TextCard extends StatelessWidget {
  final String text;

  const TextCard(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: 1 / 0,
        child: Card(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(text))));
  }
}

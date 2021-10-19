import "package:flutter/material.dart";

class Question extends StatelessWidget {
  final String topic;
  const Question({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("What's your favorite"),
        Container(
            child: Text(topic + " ?"),
            padding: const EdgeInsets.all(50),
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
            )),
      ],
    );
  }
}

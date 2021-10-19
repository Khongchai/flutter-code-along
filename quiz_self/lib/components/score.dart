import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int score;
  const Score({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("Score: $score",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)));
  }
}

import 'package:flutter/material.dart';

import '../CustomText.dart';
import 'AnswerButton.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function(int score) buttonPressed;

  const Quiz(
      {Key? key,
      required this.buttonPressed,
      required this.questionIndex,
      required this.questions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomText(questions: questions, questionIndex: questionIndex),
      ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
          .map((answer) => AnswerButton(answer["text"] as String,
              () => buttonPressed(answer["score"] as int)))
          .toList(),
    ]);
  }
}

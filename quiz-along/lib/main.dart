import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomWidgets/Quiz/EndingText.dart';
import 'CustomWidgets/Quiz/index.dart';

void main() {
  //Function provided by Flutter
  runApp(MyApp());
}

/**
 * There are two types of widgets in Flutter
 * 1. Visible -- UI widgets -- stuff that you see, like buttons, texts, cards, etc.
 * 2. Invisible -- layout & control -- stuff that controls the flow of the UI like Row(), Column(), ListView(), etc.
 *
 * There are also some stuff that falls into both categories like the container widget (invisible by default,
 * but can be styled).
 */
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 2},
        {"text": "Blue", "score": 10}
      ],
    },
    {
      "questionText": "Quel est ton film préféré?",
      "answers": [
        {"text": "Django", "score": 5},
        {"text": "LOTR", "score": 2},
        {"text": "Star Wars", "score": "1"}
      ],
    },
    {
      "questionText": "Welche ist dein Lieblingsfach?",
      "answers": [
        {"text": "Mathematik", "score": 10},
        {"text": "Wissenschaft", "score": 5},
      ],
    },
  ];

  int _questionIndex = 0;
  int _totalScore = 0;
  void _buttonPressed(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex = (_questionIndex + 1);
    });
  }

  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Hello world!")),
        body: _questionIndex == _questions.length
            ? EndingSection(
                text: "Danke für deine Teilnehme!",
                score: _totalScore,
                restartFunction: _restartQuiz,
              )
            : Quiz(
                buttonPressed: (int score) => _buttonPressed(score),
                questionIndex: _questionIndex,
                questions: _questions),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_self/components/score.dart';
import 'package:quiz_self/components/space.dart';

import 'components/answers.dart';
import 'components/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int score = 0;
  int topicPosition = 0;
  final topicAnswersMap = [
    {
      "topic": "Movie",
      "answers": [
        {"Le petit prince": 50},
        {"Dunkirk": 25},
        {"Interstellar": 40}
      ]
    },
    {
      "topic": "Games",
      "answers": [
        {"Battlefield": 10},
        {"Witcher 3": 100}
      ]
    },
    {
      "topic": "Band",
      "answers": [
        {"Two Steps From Hell": 99},
        {"Led Zeppelin": 100},
        {"Berlin Philharmonic": 50},
        {"KhongtheFork": 101}
      ]
    }
  ];

  void nextQuestion(int score) {
    print(score);
    setState(() {
      topicPosition = (topicPosition + 1) % topicAnswersMap.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quiz App',
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Quiz App Title"),
          ),
          body: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(children: [
                Score(score: score),
                const Space(),
                Question(
                    topic: topicAnswersMap[topicPosition]["topic"] as String),
                const Space(),
                Expanded(
                  child: Answers(
                      onPressed: (int score) => nextQuestion(score),
                      answers: topicAnswersMap[topicPosition]["answers"]
                          as List<Map<String, int>>),
                )
              ])),
        ));
  }
}

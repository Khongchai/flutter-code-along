import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required List<Map<String, Object>> questions,
    required int questionIndex,
  })  : _questions = questions,
        _questionIndex = questionIndex,
        super(key: key);

  final List<Map<String, Object>> _questions;
  final int _questionIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: Text(
          _questions[_questionIndex]["questionText"] as String,
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ));
  }
}

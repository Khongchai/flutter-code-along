import 'dart:ui';

import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  AnswerButton(this.buttonText, this.onPressed);
  @override
  Widget build(BuildContext context) => Container(
      width: 1.0 / 0.0,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(buttonText),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.black))));
}

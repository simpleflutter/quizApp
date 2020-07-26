import 'package:flutter/material.dart';
import 'package:quiz/widgets/bold_text.dart';
import 'package:quiz/widgets/simple_text.dart';

class QuizCardStatus extends StatelessWidget {
  final String number;
  final String text;
  final Color color;

  QuizCardStatus({this.number, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        BoldText(text: '$number', fontSize: 14, color: color),
        SimpleText(text: text, fontSize: 12, color: color),
      ],
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz/widgets/bold_text.dart';
import 'package:quiz/widgets/simple_text.dart';

class QuizTimer extends StatefulWidget {
  final int questions;
  final Function onTimerEnd;

  QuizTimer({this.questions, this.onTimerEnd});

  @override
  _QuizTimerState createState() => _QuizTimerState();
}

class _QuizTimerState extends State<QuizTimer> {
  int remainingSeconds;
  String timing = '';
  Color color;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.questions * 30;
    Timer.periodic(
      Duration(seconds: 1),
      (Timer t) {
        setState(() {
          timing = Duration(seconds: remainingSeconds).toString();
          timing = timing.split('.')[0];
          timing = timing.split(':')[1] + ' : ' + timing.split(':')[2];
          remainingSeconds--;

          if (remainingSeconds <= 120) color = Colors.red;

          if (remainingSeconds == 0) {
            widget.onTimerEnd();
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SimpleText(
          text: 'Timer',
          fontSize: 13,
        ),
        BoldText(
          text: timing,
          fontSize: 15,
          color: color,
        ),
      ],
    );
  }
}

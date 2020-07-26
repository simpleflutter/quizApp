import 'package:flutter/material.dart';
import 'package:quiz/widgets/simple_text.dart';

class MyChip extends StatelessWidget {
  final String text;
  final IconData icon;

  MyChip({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(icon, size: 18),
        SizedBox(width: 4),
        SimpleText(text: text, fontSize: 13),
      ],
    );
  }
}

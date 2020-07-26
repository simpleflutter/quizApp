import 'package:flutter/material.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  SimpleText({this.text, this.fontSize = 15, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: fontSize,
        color: color != null ? color : Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}

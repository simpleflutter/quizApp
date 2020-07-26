import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  BoldText({this.text, this.fontSize = 18, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color != null ? color : Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}

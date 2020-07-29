import 'package:flutter/material.dart';
import 'package:quiz/widgets/simple_text.dart';

class Course extends StatelessWidget {
  final String text;
  final Function onPressed;

  Course({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CircleAvatar(
        backgroundColor: Colors.green.shade200,
        radius: 30,
        child: SimpleText(
          text: text,
          fontSize: 14,
        ),
      ),
    );
  }
}

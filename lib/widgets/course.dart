import 'package:flutter/material.dart';
import 'package:quiz/widgets/simple_text.dart';

class Course extends StatelessWidget {
  final String text;

  Course({this.text});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.green.shade200,
      radius: 30,
      child: SimpleText(
        text: text,
        fontSize: 14,
      ),
    );
  }
}

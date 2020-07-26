import 'package:flutter/material.dart';
import 'package:quiz/widgets/bold_text.dart';
import 'package:quiz/widgets/simple_text.dart';

class QuestionNumber extends StatelessWidget {
  final int number;
  final bool isSelected;
  final Function onTap;

  QuestionNumber({this.number, this.isSelected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      //padding: EdgeInsets.all(8),
      child: isSelected
          ? InkWell(
            onTap: onTap,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.orange.shade300,
                child: BoldText(
                  text: '$number',
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          : InkWell(
            onTap: onTap,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 25,
                child: SimpleText(
                  text: '$number',
                  fontSize: 18,
                ),
              ),
            ),
    );
  }
}

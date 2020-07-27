import 'package:flutter/material.dart';
import 'package:quiz/widgets/bold_text.dart';
import 'package:quiz/widgets/simple_text.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double height;
  final double fontSize;
  final Color color;

  AppButton({
    this.text,
    this.onPressed,
    this.height = 55,
    this.fontSize = 18,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    //get color scheme from theme
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    Color buttonColor = color != null ? color : colorScheme.secondary;

    return Expanded(
      flex: 1,
      child: MaterialButton(
        child: BoldText(
          text: text,
          fontSize: fontSize,
          color: colorScheme.primary,
        ),
        onPressed: onPressed,

        //decoration of button

        // splashColor: colorScheme.secondary,
        color: buttonColor,
        height: height,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

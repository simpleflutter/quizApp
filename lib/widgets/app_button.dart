import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double height;
  final double fontSize;

  AppButton({
    this.text,
    this.onPressed,
    this.height = 55,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    //get color scheme from theme
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return MaterialButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: colorScheme.onPrimary,
        ),
      ),
      onPressed: onPressed,

      //decoration of button
      //  minWidth: double.infinity,

      splashColor: colorScheme.secondary,
      height: height,
      minWidth: 50,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: colorScheme.secondary),
      ),
    );
  }
}

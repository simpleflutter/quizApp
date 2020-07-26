import 'package:flutter/material.dart';
import 'package:quiz/constants/colors.dart';

class LightTheme {
  static ThemeData getTheme() {
    return ThemeData(
      fontFamily: 'Montserrat',
      scaffoldBackgroundColor: AppColors.primaryColor,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor,
        secondary: AppColors.scondaryColor,
        onPrimary: AppColors.textColorDark,
        onBackground: AppColors.textColorLight,
      ),
    );
  }
}

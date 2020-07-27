import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/screens/dashboard.dart';
import 'package:quiz/screens/quiz_screen.dart';
import 'package:quiz/screens/result_analysis.dart';
import 'package:quiz/screens/result_screen.dart';
import 'package:quiz/themes/light_theme.dart';

import 'screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.orange.shade300),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme.getTheme(),
     // home: Register(),
      ////home: QuizScreen(),
     //home: ResultScreen(),
    //home: ResultAnalysis(),
    home: Dashboard(),
    );
  }
}

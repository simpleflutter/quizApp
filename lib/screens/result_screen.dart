import 'package:flutter/material.dart';
import 'package:quiz/screens/dashboard.dart';
import 'package:quiz/screens/quiz_setup.dart';
import 'package:quiz/utils/app_navigator.dart';
import 'package:quiz/widgets/app_button.dart';
import 'package:quiz/widgets/bold_text.dart';
import 'package:quiz/widgets/simple_text.dart';

class ResultScreen extends StatelessWidget {
  final int socre;
  final int totalQuestions;
  final int marks;
  final int currentQizId;

  ResultScreen(this.socre, this.totalQuestions, this.marks, this.currentQizId);

  @override
  Widget build(BuildContext context) {
    String msg = '';
    String result = '';
    String imagePath = 'fail.jpg';

    if (socre >= 50) {
      msg = 'Congratulations';
      result = 'You have passes';
      imagePath = 'new_trophy.png';
    } else {
      msg = 'Sorry!';
      result = 'You have failed';
      imagePath = 'fail.jpg';
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Image.asset('images/new_trophy.png', width: 150),
            Image.asset('images/$imagePath', width: 150),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BoldText(
                // text: 'Congratulations!',
                // color: Colors.green.shade600,
                text: msg,
                color: Colors.red.shade600,
                fontSize: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SimpleText(
                // text: 'Congratulations!',
                // color: Colors.green.shade600,
                text: result,
                color: Colors.red.shade600,
                fontSize: 18,
              ),
            ),
            SimpleText(
                text: 'You have scored $marks Marks out of $totalQuestions',
                fontSize: 16),
            SimpleText(text: 'Your socre is $socre%', fontSize: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                text: 'Result Analysis ',
                onPressed: () {},
                height: 40,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                text: 'Play Quiz Again',
                onPressed: () {
                  AppNavigator.pushReplacement(context, QuizSetup());

                },
                height: 40,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                text: 'Dashboard',
                onPressed: () {
                  AppNavigator.pushReplacement(context, Dashboard());
                },
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

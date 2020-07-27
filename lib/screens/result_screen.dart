import 'package:flutter/material.dart';
import 'package:quiz/widgets/app_button.dart';
import 'package:quiz/widgets/bold_text.dart';
import 'package:quiz/widgets/simple_text.dart';

class ResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            Image.asset('images/fail.jpg', width: 150),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BoldText(
                // text: 'Congratulations!',
                // color: Colors.green.shade600,
                text: 'Sorry!',
                color: Colors.red.shade600,
                fontSize: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: SimpleText(
                // text: 'Congratulations!',
                // color: Colors.green.shade600,
                text: 'You have failed',
                color: Colors.red.shade600,
                fontSize: 18,
              ),
            ),
            SimpleText(
                text: 'You have scored 28 Marks out of 30', fontSize: 16),
            SimpleText(text: 'Your socre is 86%', fontSize: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                text: 'Result Analysis',
                onPressed: () {},
                height: 40,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                text: 'Play Quiz Again',
                onPressed: () {},
                height: 40,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                text: 'Dashboard',
                onPressed: () {},
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz/widgets/bold_text.dart';
import 'package:quiz/widgets/my_chip.dart';
import 'package:quiz/widgets/quiz_card_status.dart';

class MyQuizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BoldText(text: 'C Language', fontSize: 15),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          MyChip(icon: Icons.date_range, text: '12-Aug-2020'),
                          SizedBox(width: 32),
                          MyChip(icon: Icons.timer, text: '15:23'),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          QuizCardStatus(number: '20', text: 'Questions'),
                          QuizCardStatus(
                              number: '12', text: 'Correct', color: Colors.green),
                          QuizCardStatus(
                              number: '8', text: 'Wrong', color: Colors.red),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  // color: Colors.green,

                  padding: EdgeInsets.only(left: 32),
                  child: CircularPercentIndicator(
                    radius: 60,
                    percent: 0.8,
                    circularStrokeCap: CircularStrokeCap.round,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

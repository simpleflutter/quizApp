import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz/models/quiz.dart';
import 'package:quiz/services/quiz_db.dart';
import 'package:quiz/widgets/bold_text.dart';
import 'package:quiz/widgets/my_chip.dart';
import 'package:quiz/widgets/quiz_card_status.dart';

class MyQuizCard extends StatelessWidget {
  final Quiz quiz;
  final Function onTap;

  MyQuizCard(this.quiz, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BoldText(text: quiz.course, fontSize: 15),
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
                            MyChip(icon: Icons.date_range, text: quiz.quizDate),
                            SizedBox(width: 32),
                            MyChip(icon: Icons.timer, text: quiz.quizTime),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            QuizCardStatus(
                                number: quiz.totalQuestions.toString(),
                                text: 'Ques'),
                            QuizCardStatus(
                                number: quiz.correct.toString(),
                                icon: Icon(Icons.check,
                                    size: 18, color: Colors.green),
                                color: Colors.green),
                            QuizCardStatus(
                                number: quiz.wrong.toString(),
                                icon: Icon(Icons.close,
                                    size: 18, color: Colors.red),
                                color: Colors.red),
                            QuizCardStatus(
                                number: quiz.answered.toString(),
                                text: 'Solved',
                                color: Colors.grey),
                            QuizCardStatus(
                                number: quiz.unanswered.toString(),
                                text: 'Unsolved',
                                color: Colors.grey),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.green,

                    padding: EdgeInsets.only(left: 16),
                    child: CircularPercentIndicator(
                      radius: 60,
                      percent: 0.8,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: quiz.score >= 50
                          ? Colors.green.shade400
                          : Colors.red.shade300,
                      center: BoldText(
                        text: '${quiz.score}%',
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

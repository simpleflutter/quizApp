import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/services/quiz_db.dart';
import 'package:quiz/widgets/bold_text.dart';
import 'package:quiz/widgets/my_quiz_card.dart';
import 'package:quiz/widgets/option.dart';
import 'package:quiz/widgets/question_number.dart';
import 'package:quiz/widgets/simple_text.dart';
import 'package:quiz/models/quiz.dart';

class ResultAnalysis extends StatelessWidget {
  final Quiz quiz;

  ResultAnalysis(this.quiz);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 24),
          MyQuizCard(quiz),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: quiz.questions.length - 1,
              itemBuilder: (BuildContext context, int index) {
                return ResultCard(
                  int.parse(
                    quiz.questions[index],
                  ),
                  quiz.answers[index],
                  index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final int questionId;
  final int index;
  final String userAnswer;

  ResultCard(this.questionId, this.userAnswer, this.index);

  @override
  Widget build(BuildContext context) {
    String ansStatus = 'Not Answered';

    ///
    return FutureBuilder<Question>(
      future: QuizDB.instance.getQuestion(questionId),
      builder: (BuildContext context, AsyncSnapshot<Question> question) {
        if (!question.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );

        if (userAnswer == 'null') {
          ansStatus = 'Not Answered';
        } else {
          if (userAnswer != 'Unanswered') {
            if (userAnswer == question.data.answer) {
              ansStatus = 'Correct';
            } else {
              ansStatus = 'Wrong';
            }
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8),
              child: BoldText(text: '${index + 1}'),
            ),
            SimpleText(
              text: '${question.data.questionText}',
              fontSize: 19,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8),
              child: BoldText(text: 'Your Answer : $ansStatus'),
            ),
            Option(
              optionText: '${question.data.optiona}',
              index: 0,
              result: question.data.answer == 'A'
                  ? true
                  : ansStatus == 'Wrong'
                      ? userAnswer == 'A' ? false : null
                      : null,
            ),
            Option(
              optionText: '${question.data.optionb}',
              index: 1,
              result: question.data.answer == 'B'
                  ? true
                  : ansStatus == 'Wrong'
                      ? userAnswer == 'B' ? false : null
                      : null,
            ),
            Option(
              optionText: '${question.data.optionc}',
              index: 2,
              result: question.data.answer == 'C'
                  ? true
                  : ansStatus == 'Wrong'
                      ? userAnswer == 'C' ? false : null
                      : null,
            ),
            Option(
              optionText: '${question.data.optiond}',
              index: 3,
              result: question.data.answer == 'D'
                  ? true
                  : ansStatus == 'Wrong'
                      ? userAnswer == 'D' ? false : null
                      : null,
            ),
            Divider(),
          ],
        );
      },
    );
  }
}

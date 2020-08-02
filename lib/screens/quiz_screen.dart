import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/screens/dummy.dart';
import 'package:quiz/screens/result_screen.dart';
import 'package:quiz/services/quiz_db.dart';
import 'package:quiz/utils/app_navigator.dart';
import 'package:quiz/widgets/app_button.dart';
import 'package:quiz/widgets/bold_text.dart';
import 'package:quiz/widgets/option.dart';
import 'package:quiz/widgets/question_number.dart';
import 'package:quiz/widgets/quiz_card_status.dart';
import 'package:quiz/widgets/quiz_timer.dart';
import 'package:quiz/widgets/simple_text.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class QuizScreen extends StatefulWidget {
  final String course;
  final String level;
  final List<int> questionIds;

  QuizScreen(this.course, this.level, this.questionIds);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //Timmer variables
  int questions;
  Function onTimerEnd;

  //
  int remainingSeconds;
  String timing = '';
  Color color;

  //

  ItemScrollController itemScrollController = ItemScrollController();
  List<bool> optionSelected = [false, false, false, false];
  int selectedQuestionIndex = 0;
  Question question;
  List<String> userAnswers = [];
  String currentAnswer;
  List<int> answerCount = [];
  BuildContext appContext;

  @override
  void initState() {
    for (int i = 0; i < widget.questionIds.length; i++) {
      userAnswers.add('Unanswered');
      answerCount.add(0);
    }

    getQuestion(widget.questionIds[selectedQuestionIndex]);
    questions = widget.questionIds.length;

    super.initState();

    remainingSeconds = questions * 30;
    Timer.periodic(
      Duration(seconds: 1),
      (Timer t) {
        setState(
          () {
            timing = Duration(seconds: remainingSeconds).toString();
            timing = timing.split('.')[0];
            timing = timing.split(':')[1] + ' : ' + timing.split(':')[2];
            remainingSeconds--;

            if (remainingSeconds <= 120) color = Colors.red;

            if (remainingSeconds == 0) {
              confirmEndExam(true, appContext);
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void getQuestion(int id) async {
    Question temp = await QuizDB.instance.getQuestion(id);

    setState(() {
      question = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('no of question = $widget.questionIds.length');
    appContext = context;

    getQuestion(widget.questionIds[selectedQuestionIndex]);
    optionSelected = [false, false, false, false];

    // print(optionSelected);

    if (userAnswers[selectedQuestionIndex] != null) {
      //print('here ${userAnswers[selectedQuestionIndex]}');
      int index = userAnswers[selectedQuestionIndex].codeUnitAt(0) - 65;
      //print('index $index');
      if (index >= 0 && index <= 3) {
        setState(() {
          optionSelected[index] = true;
        });
      }
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 0),
              child: SimpleText(text: 'Quiz', fontSize: 13),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BoldText(text: widget.course),
                  InkWell(
                    child: BoldText(
                        text: 'End Quiz', fontSize: 14, color: Colors.red),
                    onTap: () {
                      confirmEndExam(false, context);
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: getQuestionStatus(),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SimpleText(
                        text: 'Timer',
                        fontSize: 13,
                      ),
                      BoldText(
                        text: timing,
                        fontSize: 15,
                        color: color,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // question numbers
            Container(
              width: double.infinity,
              height: 50,
              child: ScrollablePositionedList.builder(
                itemScrollController: itemScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.questionIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return QuestionNumber(
                    color: getQuestionColor(index),
                    number: index + 1,
                    isSelected: index == selectedQuestionIndex ? true : false,
                    onTap: () {
                      itemScrollController.jumpTo(
                        index: index,
                      );
                      setState(() {
                        selectedQuestionIndex = index;
                      });
                    },
                  );
                },
              ),
            ),

            Divider(color: Colors.grey),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: <Widget>[
            //     SimpleText(
            //       text:
            //           'Current Ans :${getCurrentAnswer(selectedQuestionIndex)} ',
            //     ),
            //     SimpleText(
            //       text: 'Score : ${getScore()}/$questions',
            //     ),
            //   ],
            // ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    //Question Text
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: SimpleText(
                        text: question.questionText,
                        fontSize: 21,
                      ),
                    ),

                    Option(
                      optionText: question.optiona,
                      index: 0,
                      isSelected: optionSelected[0],
                      onTap: () {
                        makeSelection(0);
                      },
                    ),
                    Option(
                      optionText: question.optionb,
                      index: 1,
                      isSelected: optionSelected[1],
                      onTap: () {
                        makeSelection(1);
                      },
                    ),
                    Option(
                      optionText: question.optionc,
                      index: 2,
                      isSelected: optionSelected[2],
                      onTap: () {
                        makeSelection(2);
                      },
                    ),
                    Option(
                      optionText: question.optiond,
                      index: 3,
                      isSelected: optionSelected[3],
                      onTap: () {
                        makeSelection(3);
                      },
                    ),

                    //Options
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        //  color: Colors.red,
        //   height: 40,
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppButton(
              height: 40,
              text: 'Previous',
              color: selectedQuestionIndex == 0 ? Colors.grey : null,
              onPressed: selectedQuestionIndex == 0
                  ? () {}
                  : () {
                      setState(() {
                        selectedQuestionIndex--;
                        itemScrollController.jumpTo(
                          index: selectedQuestionIndex,
                        );
                      });
                    },
            ),
            SizedBox(width: 16),
            AppButton(
              height: 40,
              text: 'Next',
              color: selectedQuestionIndex == widget.questionIds.length - 1
                  ? Colors.grey
                  : null,
              onPressed: selectedQuestionIndex == widget.questionIds.length - 1
                  ? () {}
                  : () {
                      setState(() {
                        if (userAnswers[selectedQuestionIndex] ==
                                'Unanswered' ||
                            userAnswers[selectedQuestionIndex] == null) {
                          userAnswers[selectedQuestionIndex] = null;
                        }

                        selectedQuestionIndex++;
                        itemScrollController.jumpTo(
                          index: selectedQuestionIndex,
                        );
                      });
                    },
            ),
          ],
        ),
      ),
    );
  }

  String makeSelection(int index) {
    int i;
    bool lastSelection = optionSelected[index];

    setState(() {
      for (i = 0; i < 4; i++) {
        optionSelected[i] = false;
      }

      optionSelected[index] = !lastSelection;
    });

    String value;
    if (optionSelected[index]) {
      value = String.fromCharCode(index + 65);
    }
    // print(value);
    userAnswers[selectedQuestionIndex] = value; // A, B, C, D
    //print('inside makeselection ${userAnswers[selectedQuestionIndex]}');

    if (getCurrentAnswer(selectedQuestionIndex)) {
      answerCount[selectedQuestionIndex] = 1;
    } else {
      answerCount[selectedQuestionIndex] = 0;
    }

    return value;
  }

  int getUnseenQuestionsCount() {
    int count = 0;

    for (int i = 0; i < questions; i++) {
      if (userAnswers[i] != null) {
        if (userAnswers[i].contains('Unanswered')) count++;
        //if(userAnswers[i]=='Unanswered') count++;
      }
    }
    return count;
  }

  int getAnsweredQuestionsCount() {
    int count = 0;

    for (int i = 0; i < questions; i++) {
      if (userAnswers[i] != null) {
        if (userAnswers[i].contains('A') ||
            userAnswers[i].contains('B') ||
            userAnswers[i].contains('C') ||
            userAnswers[i].contains('D')) {
          count++;
        }
      }
    }
    return count;
  }

  int getSkippedQuestionsCount() {
    int count =
        questions - (getAnsweredQuestionsCount() + getUnseenQuestionsCount());

    return count;
  }

  Color getQuestionColor(index) {
    if (userAnswers[index] == null) return Colors.orange;

    if (userAnswers[index].contains('A') ||
        userAnswers[index].contains('B') ||
        userAnswers[index].contains('C') ||
        userAnswers[index].contains('D')) {
      return Colors.green;
    }

    return Colors.grey;
  }

  bool getCurrentAnswer(int index) {
    if (userAnswers[index] != null) {
      if (userAnswers[index] == question.answer) return true;
    }
    return false;
  }

  int getScore() {
    int score = 0;

    for (int i = 0; i < questions; i++) {
      score += answerCount[i];
    }
    return score;
  }

  void confirmEndExam(bool isTimeEnd, BuildContext context) async {
    String msg;

    if (isTimeEnd)
      msg = 'Sorry! Your time is over.\n\n';
    else
      msg = 'Are you sure to end quiz?\n\n';

    AlertDialog alertDialog = AlertDialog(
      title: BoldText(text: 'Quiz End'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SimpleText(
            text: msg,
          ),
          getQuestionStatus(),
        ],
      ),
      actions: <Widget>[
        isTimeEnd
            ? FlatButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  //endExam();
                  return true;
                },
                child: SimpleText(
                  text: 'Ok',
                ),
              )
            : Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      Navigator.pop(context, true);
                    },
                    child: SimpleText(
                      text: 'Yes',
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                      return false;
                    },
                    child: SimpleText(
                      text: 'No',
                    ),
                  ),
                ],
              ),
      ],
    );

    bool userResponse = await showDialog(
      context: appContext,
      child: alertDialog,
    );

    print('userResponse $userResponse');

    if (userResponse == true) endExam();
  }

  // last task when exam ends
  void endExam() async {
    //
    int t = questions * 30 - remainingSeconds;
    String quizTime = Duration(seconds: t).toString();
    quizTime = quizTime.split('.')[0];
    quizTime = quizTime.split(':')[1] + ' : ' + quizTime.split(':')[2];

    //
    var d = DateTime.now();
    String quizDate =
        d.day.toString() + "/" + d.month.toString() + "/" + d.year.toString();

    //
    String quizQuestions = '';
    String quizAnswers = '';
    for (int i = 0; i < questions; i++) {
      quizQuestions = quizQuestions + widget.questionIds[i].toString() + ',';
      quizAnswers = quizAnswers + userAnswers[i].toString() + ',';
    }

    //
    int score = ((getScore() / questions) * 100).ceil();

    //
   int currentQizId = await QuizDB.instance.storeQuizData(
        widget.course,
        quizTime,
        quizDate,
        widget.level,
        quizQuestions,
        quizAnswers,
        questions,
        getAnsweredQuestionsCount(),
        questions - getAnsweredQuestionsCount(),
        getScore(),
        questions - getScore(),
        score);

    AppNavigator.pushReplacement(appContext, ResultScreen(score, questions, getScore(), currentQizId));
  }

  Widget getQuestionStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        QuizCardStatus(
          number: '${getAnsweredQuestionsCount()}/$questions',
          text: 'Answered',
          color: Colors.green,
        ),
        QuizCardStatus(
          number: '${getSkippedQuestionsCount()}/$questions',
          text: 'Skipped',
          color: Colors.orange,
        ),
        QuizCardStatus(
          number: '${getUnseenQuestionsCount()}/$questions',
          text: 'Unseen',
          color: Colors.grey,
        ),
      ],
    );
  }
}

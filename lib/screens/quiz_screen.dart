import 'package:flutter/material.dart';
import 'package:quiz/screens/dummy.dart';
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
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  ItemScrollController itemScrollController = ItemScrollController();
  List<bool> optionSelected = [false, false, false, false];
  int selectedQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(16),
        child: Column(
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
                  BoldText(text: 'C Language'),
                  InkWell(
                    child: BoldText(
                        text: 'End Quiz', fontSize: 14, color: Colors.red),
                    onTap: () {
                      //
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      QuizCardStatus(
                        number: '5/20',
                        text: 'Answered',
                        color: Colors.green,
                      ),
                      QuizCardStatus(
                        number: '7/20',
                        text: 'Skipped',
                        color: Colors.orange,
                      ),
                      QuizCardStatus(
                        number: '8/20',
                        text: 'Unseen',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: QuizTimer(
                      questions: 20,
                      onTimerEnd: () {
                        // AppNavigator.push(context, Dummy());
                      }),
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
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return QuestionNumber(
                    number: index,
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    //Question Text
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: SimpleText(
                        text:
                            'In object-oriented programming, new classes can be defined by extending existing classes. This is an example of:',
                        fontSize: 21,
                      ),
                    ),

                    Option(
                      optionText: 'Encapsulation',
                      index: 0,
                      isSelected: optionSelected[0],
                      onTap: () {
                        makeSelection(0);
                      },
                    ),
                    Option(
                      optionText: 'Interface',
                      index: 1,
                      isSelected: optionSelected[1],
                      onTap: () {
                        makeSelection(1);
                      },
                    ),
                    Option(
                      optionText: 'Composition',
                      index: 2,
                      isSelected: optionSelected[2],
                      onTap: () {
                        makeSelection(2);
                      },
                    ),
                    Option(
                      optionText: 'Inheritance',
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
        //   height: 40,
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppButton(
              height: 40,
              text: 'Previous',
              onPressed: () {
                setState(() {
                  selectedQuestionIndex--;
                  itemScrollController.jumpTo(
                    index: selectedQuestionIndex,
                  );
                });
              },
            ),
            AppButton(
              height: 40,
              text: 'Next',
              onPressed: () {
                setState(() {
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
    return value;
  }
}

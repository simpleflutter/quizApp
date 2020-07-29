import 'package:flutter/material.dart';
import 'package:quiz/services/quiz_db.dart';
import 'package:quiz/widgets/bold_text.dart';
import 'package:quiz/widgets/simple_text.dart';

class QuizSetup extends StatefulWidget {
  @override
  _QuizSetupState createState() => _QuizSetupState();
}

class _QuizSetupState extends State<QuizSetup> {
  QuizDB quizDB = QuizDB.instance;
  String selectedCourse;
  List<String> coursesList;
  int questions = 10;
  int questionsCount = 10;

  String selectedLevel;
  List<String> levelList;

  void inialize() async {
    List<String> tempList = await quizDB.getCourses();
    setState(() {
      coursesList = tempList;
      selectedCourse = coursesList[0];
    });

    List<String> tempList1 = await quizDB.getLevels();
    setState(() {
      levelList = tempList1;
      selectedLevel = levelList[0];
    });
  }

  @override
  void initState() {
    super.initState();
    inialize();
  }

  @override
  Widget build(BuildContext context) {
    int courseIndex = 0;
    int levelIndex = 0;

    return Scaffold(
      body: coursesList == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // chose course form user
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        BoldText(
                          text: 'Select Coures',
                        ),
                        DropdownButton(
                          value: selectedCourse,
                          onChanged: (newValue) {
                            setState(() {
                              selectedCourse = newValue;
                            });
                          },
                          items: coursesList.map((String course) {
                            return DropdownMenuItem(
                              child: Text(course),
                              value: course,
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // choose Level from user
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        BoldText(text: 'Select Level'),
                        DropdownButton(
                          value: selectedLevel,
                          onChanged: (newValue) {
                            setState(() {
                              selectedLevel = newValue;
                              getQuestionNumbers();
                            });
                          },
                          items: levelList.map((String level) {
                            return DropdownMenuItem(
                              child: Text(level),
                              value: level,
                            );
                          }).toList(),
                        ),
                      ],
                    ),

                    // allow user to select number of qusetions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        BoldText(
                          text: 'Number of Questions',
                        ),
                        DropdownButton(
                            value: questions,
                            onChanged: (newValue) {
                              setState(() {
                                questions = newValue;
                                getQuestionNumbers();
                              });
                            },
                            items: [
                              for (int i = 10; i <= questionsCount; i = i + 5)
                                DropdownMenuItem(
                                  child: Text('$i'),
                                  value: i,
                                )
                            ])
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }

  void getQuestionNumbers() async {
    int temp = await quizDB.getQuestionCount(selectedCourse, selectedLevel);

    setState(() {
      questionsCount = temp;
    });
  }
}

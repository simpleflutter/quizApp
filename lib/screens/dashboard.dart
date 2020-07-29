import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz_screen.dart';
import 'package:quiz/screens/quiz_setup.dart';
import 'package:quiz/services/db_helper.dart';
import 'package:quiz/services/quiz_db.dart';
import 'package:quiz/utils/app_navigator.dart';
import 'package:quiz/widgets/app_button.dart';
import 'package:quiz/widgets/bold_text.dart';
import 'package:quiz/widgets/course.dart';
import 'package:quiz/widgets/my_quiz_card.dart';
import 'package:quiz/widgets/simple_text.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DBHelper helper = DBHelper.instance;

  @override
  Widget build(BuildContext context) {
    helper.database;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(16),
        // padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            SimpleText(text: 'Hello,'),
            SizedBox(height: 4),
            BoldText(text: 'Pranav Patil'),
            Center(
              child: Image.asset(
                'images/tablet.png',
                height: 150,
              ),
            ),
            SizedBox(height: 8),
            BoldText(text: 'Courses'),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Course(
                  text: 'C',
                  onPressed: () {
                    AppNavigator.push(
                      context,
                      QuizSetup(),
                    );
                  },
                ),
                Course(text: 'C++'),
                Course(text: 'DS'),
                Course(text: 'Java'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: BoldText(text: 'My Quizes', fontSize: 16),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  MyQuizCard(),
                  MyQuizCard(),
                  MyQuizCard(),
                  MyQuizCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

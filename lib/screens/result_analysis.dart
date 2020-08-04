import 'package:flutter/material.dart';
import 'package:quiz/widgets/bold_text.dart';
import 'package:quiz/widgets/my_quiz_card.dart';
import 'package:quiz/widgets/option.dart';
import 'package:quiz/widgets/question_number.dart';
import 'package:quiz/widgets/simple_text.dart';

class ResultAnalysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          SizedBox(height: 24),
         // MyQuizCard(),

          //Question Text
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: BoldText(text: '1)'),
          ),

          SimpleText(
            text:
                'In object-oriented programming, new classes can be defined by extending existing classes. This is an example of:',
            fontSize: 19,
          ),

          Option(
            optionText: 'Encapsulation',
            index: 0,
            result: true,
          ),
          Option(
            optionText: 'Interface',
            index: 1,
          ),
          Option(
            optionText: 'Composition',
            index: 2,
          ),
          Option(
            optionText: 'Inheritance',
            index: 3,
            result: false,
          ),
          Divider(),

          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: BoldText(text: '2)'),
          ),

          SimpleText(
            text:
                'In object-oriented programming, new classes can be defined by extending existing classes. This is an example of:',
            fontSize: 20,
          ),

          Option(
            optionText: 'Encapsulation',
            index: 0,
          ),
          Option(
            optionText: 'Interface',
            index: 1,
            result: true,
          ),
          Option(
            optionText: 'Composition',
            index: 2,
          ),
          Option(
            optionText: 'Inheritance',
            index: 3,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: BoldText(text: '3)'),
          ),

          SimpleText(
            text:
                'In object-oriented programming, new classes can be defined by extending existing classes. This is an example of:',
            fontSize: 20,
          ),

          Option(
            optionText: 'Encapsulation',
            index: 0,
          ),
          Option(
            optionText: 'Interface',
            index: 1,
            result: true,
          ),
          Option(
            optionText: 'Composition',
            index: 2,
          ),
          Option(
            optionText: 'Inheritance',
            index: 3,
          ),
          Divider(),
        ],
      ),
    );
  }
}

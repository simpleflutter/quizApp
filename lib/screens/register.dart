import 'package:flutter/material.dart';
import 'package:quiz/screens/dashboard.dart';
import 'package:quiz/utils/app_navigator.dart';
import 'package:quiz/widgets/app_button.dart';
import 'package:quiz/widgets/app_text_filed.dart';
import 'package:quiz/widgets/study_logo.dart';

class Register extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StudyLogo(),
              SizedBox(height: 80),
              AppTextField(),
              SizedBox(height: 32),
              AppButton(
                  text: 'Register',
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      //save name to database & jump to home page
                      AppNavigator.push(context, Dashboard());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

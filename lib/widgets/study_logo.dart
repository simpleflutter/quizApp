import 'package:flutter/material.dart';

class StudyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.local_library,
      size: 80,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}

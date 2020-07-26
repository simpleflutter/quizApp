import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //decoration
      decoration: InputDecoration(
        hintText: 'Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
      ),

      //validation logic
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is required';
        } else {
          return null;
        }
      },
    );
  }
}

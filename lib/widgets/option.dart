import 'package:flutter/material.dart';
import 'package:quiz/widgets/simple_text.dart';

class Option extends StatelessWidget {
  final String optionText;
  final int index;
  final isSelected;
  final Function onTap;

  Option({this.optionText, this.index, this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(width: 1, color: Colors.blue.shade300)
              : Border.all(width: 1, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SimpleText(
                text: optionText,
                fontSize: 18,
                color: isSelected ? Colors.blue : null,
              ),
            ),
            getIcon()
          ],
        ),
      ),
    );
  }

  Widget getIcon() {
    if (isSelected) {
      return Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Icon(Icons.check_circle_outline, color: Colors.blue.shade400),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Icon(Icons.panorama_fish_eye, color: Colors.grey.shade400),
    );
  }
}

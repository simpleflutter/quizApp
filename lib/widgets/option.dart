import 'package:flutter/material.dart';
import 'package:quiz/widgets/simple_text.dart';

class Option extends StatelessWidget {
  final String optionText;
  final int index;
  final isSelected;
  final Function onTap;
  final bool result;

  Option({
    this.optionText,
    this.index,
    this.isSelected = false,
    this.onTap,
    this.result,
  });

  @override
  Widget build(BuildContext context) {
    var border = Border.all(width: 1, color: Colors.grey.shade300);
    var icon = Icon(Icons.panorama_fish_eye, color: Colors.grey.shade400);
    var color = Colors.black54;

    if (result != null) {
      if (result == true) {
        //
        border = Border.all(width: 1, color: Colors.green.shade200);
        icon = Icon(Icons.check_circle, color: Colors.green.shade400);
        color = Colors.green.shade400;
      } else {
        //
        border = Border.all(width: 1, color: Colors.red.shade200);
        icon = Icon(Icons.cancel, color: Colors.red.shade400);
        color = Colors.red.shade400;
      }
    } else if (isSelected) {
      //
      border = Border.all(width: 1, color: Colors.blue.shade200);
      icon = Icon(Icons.check_circle, color: Colors.blue.shade400);
      color = Colors.blue.shade400;
    } else {
      //keep defaults
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SimpleText(
                text: optionText,
                fontSize: 18,
                color: color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}

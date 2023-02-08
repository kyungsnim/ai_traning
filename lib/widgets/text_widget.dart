import 'package:flutter/material.dart';

Widget richTextWidget(
    String text, Color color, double size, FontWeight fontWeight) {
  return RichText(
    text: TextSpan(
      text: text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
      ),
    ),
    textAlign: TextAlign.center,
    maxLines: 30,
  );
}

Widget richTextMaxLineWidget(
    String text, Color color, double size, FontWeight fontWeight, int maxLine,
    {bool isCompleted = false}) {
  return RichText(
    text: TextSpan(
      text: text,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
        decoration: isCompleted ? TextDecoration.lineThrough : null,
      ),
    ),
    maxLines: maxLine,
  );
}

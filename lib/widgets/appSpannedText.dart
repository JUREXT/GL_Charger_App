import 'package:flutter/material.dart';

import '../utils/constants.dart';

Widget appSpannedText(String text1, String text2, double fontSize, Color textColor1, Color textColor2) {
  return RichText(
    text: TextSpan(
      text: text1,
      style: TextStyle(
        color: textColor1,
        fontWeight: FontWeight.normal,
        fontSize: fontSize,
      ),
      children: [
        TextSpan(text: " "),
        TextSpan(
          text: text2,
          style: TextStyle(
            color:  textColor2,
            fontSize: fontSize,
          ),
        ),
      ],
    ),
  );
}

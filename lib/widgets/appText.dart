import 'package:flutter/material.dart';

Widget appText(String text, double textSize, Color textColor, TextDecoration decoration) {
  return Text(text, style: TextStyle(fontSize: textSize, color: textColor, fontFamily: "SF", decoration: decoration));
}

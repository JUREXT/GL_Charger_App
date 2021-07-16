import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {

  final String text;
  final double textSize;
  final Color textColor;
  final TextDecoration decoration;
  final String fontFamily;

  const TextCustom({Key key, @required this.text, @required this.textSize, @required this.textColor, @required this.decoration, this.fontFamily = "SF"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: textSize, color: textColor, fontFamily: fontFamily, decoration: decoration));
  }
}


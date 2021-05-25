import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'appSpannedText.dart';

Widget appText(String text, double textSize, Color textColor, TextDecoration decoration) {
  return  Container(
    width: 150,
    height: 70,
    color: Constants.ColorWhite,
    child: appSpannedText("Duration:", "1h 30min", 12,
        Constants.ColorWhite, Constants.ColorYellow),
  );
}

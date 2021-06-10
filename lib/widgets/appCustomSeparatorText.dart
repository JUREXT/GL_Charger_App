import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'appText.dart';

Widget appCustomSeparatorText() {
  return Container(
    // color: Colors.greenAccent,
    width: double.infinity,
    height: 20,
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Divider(
            height: 1,
            thickness: 1,
            indent: 16,
            endIndent: 0,
            color: Constants.ColorYellow,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: appText("or", 15.0, Constants.ColorLightPurple, TextDecoration.none),
            alignment: Alignment.center,
          ),
        ),
        Expanded(
          flex: 2,
          child: Divider(
            height: 1,
            thickness: 1,
            indent: 0,
            endIndent: 16,
            color: Constants.ColorYellow,
          ),
        ),
      ],
    ),
  );
}

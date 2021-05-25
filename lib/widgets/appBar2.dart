import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/constants.dart';

Widget appBar2(String title1, String title2) {
  return AppBar(
    backgroundColor: Constants.ColorLightGrey,
    title: RichText(
      text: TextSpan(
        text: title1,
        style: TextStyle(
          color: Constants.ColorWhite,
          fontWeight: FontWeight.normal,
          fontSize: 24,
        ),
        children: [
          TextSpan(text: " "),
          TextSpan(
            text: title2,
            style: TextStyle(
              color:  Constants.ColorYellow,
              fontSize: 24,
            ),
          ),
        ],
      ),
    ),
    bottom: PreferredSize(
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(color: Colors.orange, height: 2.0)),
        preferredSize: Size.fromHeight(2.0)),
  );
}

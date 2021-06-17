import 'package:flutter/material.dart';

import '../utils/constants.dart';

Widget appBar1(String title) {
  return AppBar(
    backgroundColor: Constants.ColorLightGrey,
    title: Text(title, style: TextStyle(fontSize: 24.0, color: Constants.ColorWhite)),
    automaticallyImplyLeading: false,
    bottom: PreferredSize(
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(color: Constants.ColorYellow, height: 2.0)),
        preferredSize: Size.fromHeight(2.0)),
  );
}
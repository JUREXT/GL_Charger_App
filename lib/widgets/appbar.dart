import 'package:flutter/material.dart';

import '../utils/constants.dart';

Widget appBar1(String title) {
  return AppBar(
    title: Text(title, style: TextStyle(fontSize: 24.0, color: Constants.lightBG)),
    bottom: PreferredSize(
        child: Container(
          color: Colors.orange,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(2.0)),
  );
}
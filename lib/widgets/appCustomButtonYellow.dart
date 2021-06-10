import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';

import 'appText.dart';

class AppCustomButtonYellow extends StatelessWidget {

  final GestureTapCallback onPressed;
  final String text;

  AppCustomButtonYellow({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: 80,
      child: RaisedButton(
        child: appText(text, 17.0, Constants.ColorBlack, TextDecoration.none),
        color: Constants.ColorYellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
      ),
    );
  }
}
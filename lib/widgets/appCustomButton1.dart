import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';

import 'appText.dart';

class AppCustomButton1 extends StatelessWidget {

  final GestureTapCallback onPressed;
  final String text;
  AppCustomButton1({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: 80,
      child: RaisedButton(
        child: appText(text, 17.0,  Constants.ColorYellow, TextDecoration.none),
        color: Constants.ColorBlack,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
      ),
    );
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';

class ButtonBlack extends StatelessWidget {

  final GestureTapCallback onPressed;
  final String text;

  ButtonBlack({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: 80,
      child: RaisedButton(
        child: TextCustom(text: text, textSize: 17.0, textColor: Constants.ColorYellow, decoration: TextDecoration.none),
        color: Constants.ColorBlack,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
      ),
    );
  }
}
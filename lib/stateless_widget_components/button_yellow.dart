import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';

class ButtonYellow extends StatelessWidget {

  final GestureTapCallback onPressed;
  final String text;

  ButtonYellow({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        color: Constants.ColorYellow,
        child: MaterialButton(
          child: TextCustom(text: text, textSize: 17.0, textColor: Constants.ColorBlack, decoration: TextDecoration.none),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
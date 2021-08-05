import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';

class ButtonText extends StatelessWidget {

  final GestureTapCallback onPressed;
  final String text;

  ButtonText({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextButton(
        onPressed: onPressed,
        child: TextCustom(text: text, textSize: 15.0, textColor: Constants.ColorYellow, decoration: TextDecoration.underline),
      ),
    );
  }
}
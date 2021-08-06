import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';

class ButtonText extends StatelessWidget {

  final GestureTapCallback onPressed;
  final String text;
  final TextDecoration textDecoration;
  final Color textColor;
  final double textSize;

  ButtonText({@required this.onPressed, @required this.text, this.textDecoration, this.textColor, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextButton(
        onPressed: onPressed,
        child: TextCustom(text: text, textSize: textSize, textColor: textColor, decoration: textDecoration),
      ),
    );
  }
}
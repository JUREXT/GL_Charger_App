import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';

class SpannedText extends StatelessWidget {

  final String text1;
  final String text2;
  final double fontSize;
  final Color textColor1;
  final Color textColor2;
  final String separator;

  const SpannedText({Key key, @required this.text1, @required this.text2, @required this.fontSize, @required this.textColor1, @required this.textColor2, this.separator = " "}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(text: TextCustom(text: text1, textSize: fontSize, textColor: textColor1, decoration: TextDecoration.none).toString(),
        children: [
          TextSpan(text: separator),
          TextSpan(text: TextCustom(text: text2, textSize: fontSize, textColor: textColor2, decoration: TextDecoration.none).toString()),
        ],
      ),
    );
  }
}

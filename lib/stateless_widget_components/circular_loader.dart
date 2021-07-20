import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';

class CircularLoader extends StatelessWidget {

  final String text;
  CircularLoader({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(width: 20),
          TextCustom(text: text, textSize: 15.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none)
        ],
      ),
    );
  }
}
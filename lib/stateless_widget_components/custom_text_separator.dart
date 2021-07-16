import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';


class CustomTextSeparator extends StatelessWidget {
  // final String text1;
  // final String text2;
  // final double fontSize;
  // final Color textColor1;
  // final Color textColor2;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.greenAccent,
      width: double.infinity,
      height: 20,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Divider(
              height: 1,
              thickness: 1,
              indent: 16,
              endIndent: 0,
              color: Constants.ColorYellow,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: TextCustom(
                  text: "or",
                  textSize: 15.0,
                  textColor: Constants.ColorLightPurple,
                  decoration: TextDecoration.none),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Divider(
              height: 1,
              thickness: 1,
              indent: 0,
              endIndent: 16,
              color: Constants.ColorYellow,
            ),
          ),
        ],
      ),
    );
  }
}

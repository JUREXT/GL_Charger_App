import 'package:flutter/material.dart';
import 'package:gl_charge_app/components/text_custom.dart';

import '../utils/constants.dart';

Widget appCustomSeparatorText() { // TODO: use it and updated it to StatelessWidget somewhere
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
            child: TextCustom(text: "or", textSize: 15.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none),
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

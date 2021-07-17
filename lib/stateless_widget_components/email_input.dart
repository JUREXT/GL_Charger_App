import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';

class EmailInput extends StatelessWidget {

  final String hintText;
  final String labelText;

  EmailInput({@required this.hintText, @required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: 66,
      child: Theme(
          data: ThemeData(
            primaryColor: Constants.ColorYellow,
            primaryColorDark: Constants.ColorWhite,
            hintColor: Constants.ColorLightPurple,
          ),
          child: TextField(
            style: TextStyle(color: Constants.ColorWhite, fontSize: 17),
            decoration: InputDecoration(
                hintText: hintText,
                labelText: labelText,
                labelStyle: TextStyle(color: Constants.ColorYellow, fontSize: 14)),
          )),
    );
  }
}

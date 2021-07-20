import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/validators.dart';

class EmailInput extends StatelessWidget {

  final String hintText;
  final String labelText;
  final bool autofocus;
  final Function(String) onValueCallback;
  EmailInput({@required this.hintText, @required @required this.labelText, this.autofocus = false, @required this.onValueCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: 90,
      child: Theme(
          data: ThemeData(
            primaryColor: Constants.ColorYellow,
            primaryColorDark: Constants.ColorWhite,
            hintColor: Constants.ColorLightPurple,
          ),
          child: TextFormField(
            autofocus: autofocus,
            validator: emailValidator,
            onSaved: (value) => onValueCallback(value),
            style: TextStyle(color: Constants.ColorWhite, fontSize: 17),
            decoration: InputDecoration(
                hintText: hintText,
                labelText: labelText,
                labelStyle: TextStyle(color: Constants.ColorYellow, fontSize: 14)),
          )),
    );
  }
}

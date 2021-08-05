import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/validation.dart';

class EmailInput extends StatelessWidget {

  final String hintText;
  final String labelText;
  final bool autofocus;
  final bool formEnabled;
  final Function(String) onValueCallback;
  final TextEditingController controller;
  EmailInput({@required this.hintText, @required @required this.labelText, this.autofocus = false, @required this.onValueCallback, this.formEnabled, this.controller});

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
            enabled: formEnabled,
            autofocus: autofocus,
            validator: (value) => Validations.validateEmail(value),
            onSaved: (value) => onValueCallback(value),
            controller: controller,
            style: TextStyle(color: Constants.ColorWhite, fontSize: 17),
            decoration: InputDecoration(
                hintText: hintText,
                labelText: labelText,
                suffixIcon: Icon(Icons.email, color: Color.fromRGBO(50, 62, 72, 1.0)),
                labelStyle: TextStyle(color: Constants.ColorYellow, fontSize: 14)),
          )),
    );
  }
}

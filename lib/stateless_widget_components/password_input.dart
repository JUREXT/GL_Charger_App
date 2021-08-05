import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/validation.dart';

class PasswordInput extends StatefulWidget {

  final String hintText;
  final String labelText;
  final bool autofocus;
  final bool formEnabled;
  final Function(String) onValueCallback;
  final TextEditingController controller;
  PasswordInput({@required this.hintText, @required this.labelText, this.autofocus = false, @required this.onValueCallback, this.formEnabled, this.controller});

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  var _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: 80,
      child: Theme(
          data: ThemeData(
            primaryColor: Constants.ColorYellow,
            primaryColorDark: Constants.ColorWhite,
            hintColor: Constants.ColorLightPurple,
          ),
          child: TextFormField(
            enabled: widget.formEnabled,
            autofocus: false,
            validator: (value) => Validations.validatePassword(value),
            onSaved: (value) => widget.onValueCallback(value),
            controller: widget.controller,
            style: TextStyle(color: Constants.ColorWhite, fontSize: 17),
            decoration: InputDecoration(
                hintText: widget.hintText,
                labelText: widget.labelText,
                labelStyle: TextStyle(color: Constants.ColorYellow, fontSize: 14),
                suffixIcon: IconButton(
                  icon: Icon(_passwordVisible  ? Icons.visibility_off : Icons.visibility,
                    color: Color.fromRGBO(50, 62, 72, 1.0),
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )),
              obscureText: !_passwordVisible,
          )));
  }
}

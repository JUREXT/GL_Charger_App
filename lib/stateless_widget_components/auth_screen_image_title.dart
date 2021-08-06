import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';

class AuthScreenImageTitle extends StatelessWidget {

  final String title;
  AuthScreenImageTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Center(child: Image.asset("assets/images/logo_25_size.png", height: 46))),
        SizedBox(height: 50),
        Container(
          child: Center(child: TextCustom(text: title, textSize: 34.0, textColor: Constants.ColorYellow, decoration: TextDecoration.none)),
        )
      ],
    );
  }
}

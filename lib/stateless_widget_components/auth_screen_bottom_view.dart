import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';

class AuthScreenBottomView extends StatelessWidget {

  final String accountText; // don't have account / already have account
  final String accountClickText; // sign in / sign up
  final String privacyText1; // by signing up you agree privacy text
  final String privacyText2; // privacy policy and terms

  final GestureTapCallback onSignCallback;
  final GestureTapCallback onPrivacyCallback;

  const AuthScreenBottomView({Key key, @required this.accountText, @required this.accountClickText, @required this.privacyText1, @required this.onSignCallback, @required this.onPrivacyCallback, this.privacyText2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.redAccent,
      height: 130,
      width: double.infinity,
      child: Stack( // TODO: update with better solution, column?
        children: [
          Positioned(
              top: 17,
              left: 35,
              child: TextCustom(
                  text: accountText,
                  textSize: 17.0,
                  textColor: Constants.ColorLightPurple,
                  decoration: TextDecoration.none)),
          Positioned(
              top: 17,
              right: 45,
              child: GestureDetector(
                onTap: () => onSignCallback(),
                child: TextCustom(
                    text: accountClickText,
                    textSize: 17.0,
                    textColor: Constants.ColorYellow,
                    decoration: TextDecoration.underline),
              )),
          Positioned(
              top: 70,
              left: 37,
              right: 37,
              child: GestureDetector(
                onTap: () => onPrivacyCallback(),
                child: RichText(
                  text: TextSpan(
                    text: privacyText1,
                    style: TextStyle(fontSize: 12, color: Constants.ColorLightPurple),
                    children: <TextSpan>[
                      TextSpan(text: privacyText2, style: TextStyle(fontSize: 12,decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

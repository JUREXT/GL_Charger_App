import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';

import 'button_text.dart';

class AuthScreenBottomView extends StatelessWidget {
  final String accountText; // don't have account / already have account
  final String accountClickText; // sign in / sign up
  final String privacyText1; // by signing up you agree privacy text
  final String privacyText2; // privacy policy and terms

  final GestureTapCallback onActionCallback;
  final GestureTapCallback onPrivacyCallback;

  const AuthScreenBottomView({Key key,
      @required this.accountText,
      @required this.accountClickText,
      @required this.privacyText1,
      @required this.onActionCallback,
      @required this.onPrivacyCallback,
      this.privacyText2}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(child: TextCustom(text: accountText, textSize: 17.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none)),
                Flexible(child: ButtonText(text: accountClickText, onPressed: () => onActionCallback()))
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                    child: GestureDetector(
                    onTap: () => onPrivacyCallback(),
                    child: RichText(
                      text: TextSpan(
                        text: privacyText1,
                        style: TextStyle(
                            fontSize: 12, color: Constants.ColorLightPurple),
                            children: <TextSpan>[TextSpan(text: privacyText2, style: TextStyle(fontSize: 12, decoration: TextDecoration.underline))],
                      ),
                    ),
                )),
              ],
            ),
            SizedBox(height: 20),
          ],
        ));
  }
}

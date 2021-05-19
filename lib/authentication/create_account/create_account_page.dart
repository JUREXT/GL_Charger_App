import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/components/password_text_field.dart';
import 'package:gl_charge_app/components/text_form_builder.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/validation.dart';
import 'package:gl_charge_app/widgets/appText.dart';
import 'package:provider/provider.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

// https://mightytechno.com/rounded-button-flutter/

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {

    // LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: Constants.ColorLightGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            Container(
              //color: Colors.black87,
              height: 150,
              child: Center(
                child: Image.asset("assets/images/logo.png", height: 46),
              ),
            ),
            SizedBox(height: 30),
            Container(
              //  color: Colors.red,
              height: 50,
              child: Center(
                child: appText("Create an account", 40.0, Constants.ColorYellow, TextDecoration.none),
              ),
            ),
            SizedBox(height: 80),
            Container(
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
                        hintText: "michael@gmail.com",
                        labelText: "Your Email",
                        labelStyle: TextStyle(
                            color: Constants.ColorYellow, fontSize: 14)),
                  )),
            ),
            SizedBox(height: 15.0),
            Container(
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
                        hintText: "Create a strong password",
                        labelText: "Your password",
                        labelStyle: TextStyle(
                            color: Constants.ColorYellow, fontSize: 14)),
                  )),
            ),
            Container(
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
                        hintText: "Repeat password",
                        labelText: "Repeat password",
                        labelStyle: TextStyle(
                            color: Constants.ColorYellow, fontSize: 14)),
                  )),
            ),
            SizedBox(height: 15.0),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              width: double.infinity,
              height: 80,
              child: Container(
                width: double.infinity,
                height: 80,
                child: RaisedButton(
                  child: appText("Continue an account", 17.0, Constants.ColorBlack, TextDecoration.none),
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    // TODO: handle click
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              // color: Colors.redAccent,
              height: 130,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                      top: 17,
                      left: 35,
                      child: appText("Already have an account?", 17.0,
                          Constants.ColorLightPurple, TextDecoration.none)),
                  Positioned(
                      top: 17,
                      right: 45,
                      child: appText("Sign In", 17.0, Constants.ColorYellow, TextDecoration.underline)),
                  Positioned(
                      top: 70,
                      left: 37,
                      right: 37,
                      child: RichText(
                        text: TextSpan(
                          text: 'By signing up you agree to our ',
                          style: TextStyle(
                              fontSize: 12, color: Constants.ColorLightPurple),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Privacy Policy and Terms.',
                                style: TextStyle(
                                    fontSize: 12,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // TODO: Single tapped.. to the terms website
                                  }),
                          ],
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

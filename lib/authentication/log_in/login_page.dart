import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/authentication/create_account/create_account_page.dart';
import 'package:gl_charge_app/authentication/landing/landing_page.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appText.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

// https://mightytechno.com/rounded-button-flutter/

class _LogInPageState extends State<LogInPage> {
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
                child: appText("Sign Up", 40.0, Constants.ColorYellow,
                    TextDecoration.none),
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
              height: 80,
              child: Container(
                width: double.infinity,
                height: 80,
                child: RaisedButton(
                  child: appText("Continue", 17.0, Constants.ColorBlack,
                      TextDecoration.none),
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    // TODO: handle click
                    Route route = MaterialPageRoute(builder: (context) => LandingPage());
                    Navigator.pushReplacement(context, route);
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
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
                      child: appText("or", 15.0, Constants.ColorLightPurple,
                          TextDecoration.none),
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
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              width: double.infinity,
              height: 80,
              child: RaisedButton(
                child: appText("Continue with Google", 17.0,
                    Constants.ColorYellow, TextDecoration.none),
                color: Constants.ColorBlack,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  // TODO: handle click
                  Route route = MaterialPageRoute(builder: (context) => CreateAccountPage());
                  Navigator.pushReplacement(context, route);
                },
              ),
            ),
            SizedBox(height: 10),
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
                      child: appText("Sign In", 17.0, Constants.ColorYellow,
                          TextDecoration.underline)),
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

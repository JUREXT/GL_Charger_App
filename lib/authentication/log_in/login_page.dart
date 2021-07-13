import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/screens/start_tabs_screen_holder.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBarBackNavigation.dart';
import 'package:gl_charge_app/widgets/appCustomButtonYellow.dart';
import 'package:gl_charge_app/widgets/appText.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {

    // LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: Constants.ColorLightGrey,
      appBar: appBarBackNavigation(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              //color: Colors.black87,
              height: 150,
              child: Center(
                child: Image.asset("assets/images/logo_25_size.png", height: 46),
              ),
            ),
            SizedBox(height: 80),
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
            AppCustomButtonYellow(
                text: "Continue",
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (context) => StartTabsScreenHolder());
                  Navigator.pushReplacement(context, route);
                }),
            SizedBox(height: 30),
           // appCustomSeparatorText(),
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

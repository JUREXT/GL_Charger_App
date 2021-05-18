import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appText.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

// https://mightytechno.com/rounded-button-flutter/

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 100),
            Container(
            //  color: Colors.red,
              height: 50,
              child: Center(
                child: appText("Sign Up", 40.0, Constants.ColorYellow),
              ),
            ),
            SizedBox(height: 150),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              width: double.infinity,
              height: 80,
              child: RaisedButton(
                child: appText("Sign up for free", 17.0, Constants.ColorBlack),
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  // TODO: handle click
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              width: double.infinity,
              height: 80,
              child: RaisedButton(
                child: appText("Continue with Google", 17.0, Constants.ColorYellow),
                color: Constants.ColorBlack,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  // TODO: handle click
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
             // color: Colors.redAccent,
              height: 90,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                      top: 17,
                      left: 35,
                      child: appText("Already have an account?", 17.0,
                          Constants.ColorLightPurple)),
                  Positioned(
                      top: 17,
                      right: 45,
                      child: appText("Sign In", 17.0,
                          Constants.ColorYellow))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

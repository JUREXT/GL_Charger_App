import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/authentication/create_account/create_account_page.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appCustomButtonYellow.dart';
import 'package:gl_charge_app/widgets/appText.dart';
import '../log_in/login_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

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
                child: Image.asset("assets/images/logo_25_size.png", height: 46),
              ),
            ),
            SizedBox(height: 100),
            Container(
            //  color: Colors.red,
              height: 50,
              child: Center(
                child: appText("Sign Up", 40.0, Constants.ColorYellow, TextDecoration.none),
              ),
            ),
            SizedBox(height: 280),
            AppCustomButtonYellow(
                text: "Sign up free",
                onPressed: () {
                  Route route = MaterialPageRoute(builder: (context) => CreateAccountPage());
                  Navigator.push(context, route);
                }),
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
                      child: GestureDetector(
                        // onTap: () {
                        //   Route route = MaterialPageRoute(builder: (context) => LogInPage());
                        //   Navigator.push(context, route);
                        // },
                        child: appText("Already have an account?", 17.0,
                            Constants.ColorLightPurple, TextDecoration.none),
                      )),
                  Positioned(
                      top: 17,
                      right: 45,
                      child: GestureDetector(
                        onTap: () {
                          Route route = MaterialPageRoute(builder: (context) => LogInPage());
                          Navigator.push(context, route);
                        },
                        child: appText("Sign In", 17.0,
                            Constants.ColorYellow, TextDecoration.underline),
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

// Route route = MaterialPageRoute(builder: (context) => TabsScreenHolder());
// Navigator.pushReplacement(context, route);

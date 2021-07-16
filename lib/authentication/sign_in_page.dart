import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/authentication/create_account_page.dart';
import 'package:gl_charge_app/stateless_widget_components/button_yellow.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'sign_up_page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                child: TextCustom(text: "Sign In", textSize: 40.0, textColor: Constants.ColorYellow, decoration: TextDecoration.none),
              ),
            ),
            SizedBox(height: 280),
            ButtonYellow(
                text: "Sign In",
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
                        child: TextCustom(text: "Already have an account?", textSize: 17.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none))
                  ),
                  Positioned(
                      top: 17,
                      right: 45,
                      child: GestureDetector(
                        onTap: () {
                          Route route = MaterialPageRoute(builder: (context) => SignUpPage());
                          Navigator.push(context, route);
                        },
                        child: TextCustom(text: "Sign Up", textSize: 17.0, textColor: Constants.ColorYellow, decoration: TextDecoration.underline),
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

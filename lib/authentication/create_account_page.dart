import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/screens/main_tabs_screen_holder.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar_with_back_navigation.dart';
import 'package:gl_charge_app/stateless_widget_components/button_yellow.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/url_navigation.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {

    // LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: Constants.ColorLightGrey,
      appBar: AppBarWithBackNavigation(onNavigateBackCallback: () => { Navigator.pop(context, false) }),
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
            SizedBox(height: 30),
            Container(
              //  color: Colors.red,
              height: 50,
              child: Center(
                child: TextCustom(text: "Create an account", textSize: 40.0, textColor: Constants.ColorYellow, decoration: TextDecoration.none)),
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
            ButtonYellow(text: "Create Account", onPressed: () {
              Route route = MaterialPageRoute(builder: (context) => MainTabsScreenHolder());
                  Navigator.pushReplacement(context, route);
                }),
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
                      child: TextCustom(text: "Already have an account?", textSize: 17.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none)),
                  Positioned(
                      top: 17,
                      right: 45,
                      child: TextCustom(text: "Sign In", textSize: 17.0, textColor: Constants.ColorYellow, decoration: TextDecoration.underline)),
                  Positioned(
                      top: 70,
                      left: 37,
                      right: 37,
                      child: GestureDetector(
                        onTap: () =>  UrlNavigation.navigateTo(context, Constants.privacyPolicyUrl),
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
                                      decoration: TextDecoration.underline)),
                            ],
                          ),
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

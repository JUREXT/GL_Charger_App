import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar_with_back_navigation.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_bottom_view.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_image_title.dart';
import 'package:gl_charge_app/stateless_widget_components/button_yellow.dart';
import 'package:gl_charge_app/stateless_widget_components/email_input.dart';
import 'package:gl_charge_app/stateless_widget_components/password_input.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/url_navigation.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {

  //  var navigate = Provider.of<NavigationNotifier>(context);

    return Scaffold(
      backgroundColor: Constants.ColorLightGrey,
      appBar: AppBarWithBackNavigation(backIconVisible: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
           // SizedBox(height: 20),
            AuthScreenImageTitle(title: "Sign In"),
            SizedBox(height: 30),
            EmailInput(hintText: "your@gmail.com", labelText: "Your Email"),
            SizedBox(height: 12.0),
            PasswordInput(hintText: "Create a strong password", labelText: "Your password"),
            SizedBox(height: 20.0),
            ButtonYellow(text: "Continue", onPressed: () => signInClick()),
            SizedBox(height: 25),
            GestureDetector(
              onTap: () => forgotPasswordClick(),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(alignment: Alignment.centerLeft, child: TextCustom(text: "Forgot password?", textSize: 15.0, textColor: Constants.ColorYellow, decoration: TextDecoration.underline)),
              ),
            ),
            SizedBox(height: 30),
            AuthScreenBottomView(
                accountText: "Don't have account?",
                accountClickText: "Sign Up",
                privacyText1: "By signing up you agree to our ",
                privacyText2: "Privacy Policy and Terms",
                onPrivacyCallback: () => privacyClick(),
                onSignCallback: () => signUpActionClick()),
          ],
        ),
      ),
    );
  }

  signInClick() {
    // Route route = MaterialPageRoute(builder: (context) => SelectChargerScreen());
    // Navigator.pushReplacement(context, route);
  }

  privacyClick() {
    print("privacyClick");
    UrlNavigation.navigateTo(context, Constants.privacyPolicyUrl);
  }

  signUpActionClick() {
    print("signUpActionClick");
    // Route route = MaterialPageRoute(builder: (context) => CreateAccountPage());
    // Navigator.pushReplacement(context, route);
  }

  forgotPasswordClick() {
    print("forgotPasswordClick");
    // Route route = MaterialPageRoute(builder: (context) => ForgotPasswordPage());
    // Navigator.pushReplacement(context, route);

  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar_with_back_navigation.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_bottom_view.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_image_title.dart';
import 'package:gl_charge_app/stateless_widget_components/button_yellow.dart';
import 'package:gl_charge_app/stateless_widget_components/email_input.dart';
import 'package:gl_charge_app/stateless_widget_components/password_input.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/url_navigation.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {

    //final navigate = Provider.of<NavigationNotifier>(context);
    final navigate = "";

    return Scaffold(
      backgroundColor: Constants.ColorLightGrey,
      appBar: AppBarWithBackNavigation(onNavigateBackCallback: () => navigateBackClick()),
      body: SingleChildScrollView(
        child: Column(
          children: [
           // SizedBox(height: 20),
            AuthScreenImageTitle(title: "Create and account"),
            SizedBox(height: 30),
            EmailInput(hintText: "your@gmail.com", labelText: "Your Email", autofocus: true, onValueCallback: (email) => { print("Entered Email $email") }),
            SizedBox(height: 12.0),
            PasswordInput(hintText: "Create a strong password", labelText: "Your password"),
            SizedBox(height: 12.0),
            PasswordInput(hintText: "Repeat password", labelText: "Repeat password"),
            SizedBox(height: 15.0),
            ButtonYellow(text: "Create an account", onPressed: () => createAccountClick()),
            SizedBox(height: 30),
            AuthScreenBottomView(
                accountText: "Already have an account?",
                accountClickText: "Sign In",
                privacyText1: "By signing up you agree to our ",
                privacyText2: "Privacy Policy and Terms",
                onPrivacyCallback: () => privacyClick(),
                onSignCallback: () => signInActionClick()),
          ],
        ),
      ),
    );
  }

  navigateBackClick() {
    print("navigateBackClick");
  }

  createAccountClick() {
    print("createAccountClick");
    // TODO: later should register on the api and the go to sign in
  }

  privacyClick() {
    print("privacyClick");
    UrlNavigation.navigateTo(context, Constants.privacyPolicyUrl);
  }

  signInActionClick() {
    print("signActionClick");
  }
}

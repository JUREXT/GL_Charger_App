import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/screens/main_tabs_screen_holder.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar_with_back_navigation.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_bottom_view.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_image_title.dart';
import 'package:gl_charge_app/stateless_widget_components/button_yellow.dart';
import 'package:gl_charge_app/stateless_widget_components/email_input.dart';
import 'package:gl_charge_app/stateless_widget_components/password_input.dart';
import 'package:gl_charge_app/utils/constants.dart';

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
      appBar: AppBarWithBackNavigation(onNavigateBackCallback: () => navigateBackClick()),
      body: SingleChildScrollView(
        child: Column(
          children: [
           // SizedBox(height: 20),
            AuthScreenImageTitle(title: "Create and account"),
            SizedBox(height: 30),
            EmailInput(hintText: "your@gmail.com", labelText: "Your Email"),
            PasswordInput(hintText: "Create a strong password", labelText: "Your password"),
            PasswordInput(hintText: "Repeat password", labelText: "Repeat password"),
            SizedBox(height: 15.0),
            ButtonYellow(text: "Create Account", onPressed: () => createAccountClick()),
            SizedBox(height: 30),
            AuthScreenBottomView(
                accountText: "Don't have account?",
                accountClickText: "Sign Up",
                privacyText1: "By signing up you agree to our",
                privacyText2: "Privacy Policy and Terms",
                onPrivacyCallback: () => privacyClick(),
                onSignCallback: () => signActionClick()),
          ],
        ),
      ),
    );
  }

  navigateBackClick() {
    print("navigateBackClick");
    Navigator.pop(context, false);
  }

  createAccountClick() {
    Route route = MaterialPageRoute(builder: (context) => MainTabsScreenHolder());
    Navigator.pushReplacement(context, route);
  }

  privacyClick() {
    print("privacyClick");
  }

  signActionClick() {
    print("signActionClick");
  }

}

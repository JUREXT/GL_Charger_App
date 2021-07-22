import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/authentication_bloc.dart';
import 'package:gl_charge_app/network/modern_networking/sign_in_response.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar_with_back_navigation.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_bottom_view.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_image_title.dart';
import 'package:gl_charge_app/stateless_widget_components/button_yellow.dart';
import 'package:gl_charge_app/stateless_widget_components/circular_loader.dart';
import 'package:gl_charge_app/stateless_widget_components/email_input.dart';
import 'package:gl_charge_app/stateless_widget_components/password_input.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/snack_bar.dart';
import 'package:gl_charge_app/utils/url_navigation.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final _formKey = new GlobalKey<FormState>();
  TextEditingController controllerPassword = new TextEditingController();
  String _email, _password;
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc();
  }

  @override
  Widget build(BuildContext context) {

    signInClick() {
      _authenticationBloc.signIn("lokovsek.jure@gmail.com", "123456Jl"); // TODO: HARD CODED FOR TEST
      final form = _formKey.currentState;
      if (form.validate()) {
        form.save();
        print("Email is valid $_email");
        print("Password is valid $_password");
        _authenticationBloc.signIn("lokovsek.jure@gmail.com", "123456Jl"); // TODO: HARD CODED FOR TEST
      } else {
        print("Form is invalid");
      }
    }

    Widget streamBuilderContainer() {
      return Container(
        child: StreamBuilder<ApiResponse<SignInResponse>>(
          stream: _authenticationBloc.signInStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  print("LOADING");
                  return CircularLoader(text: "Signing In", visibleProgress: true);
                  break;
                case Status.COMPLETED:
                  print("COMPLETED");
                  print("Navigate....");
                  return ButtonYellow(text: "Continue", onPressed: () => signInClick());
                  break;
                case Status.ERROR:
                  print("ERROR");
                  WidgetsBinding.instance.addPostFrameCallback((_) => {
                    print("Show Error to user!"),
                    showSnackBar(context, "Error Title", snapshot.data.message, 5),
                  });
                  return ButtonYellow(text: "Continue", onPressed: () => signInClick());
                  break;
              }
            }
            print("DEFAULT");
            return ButtonYellow(text: "Continue", onPressed: () => signInClick());
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: Constants.ColorLightGrey,
      appBar: AppBarWithBackNavigation(backIconVisible: false),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
             // SizedBox(height: 20),
              AuthScreenImageTitle(title: "Sign In"),
              SizedBox(height: 30),
              EmailInput(hintText: "your@gmail.com", labelText: "Your Email", autofocus: false, onValueCallback: (value) => { _email = value }),
              PasswordInput(hintText: "Create a strong password", labelText: "Your password", autofocus: false, onValueCallback: (value) => { _password = value }, controller: controllerPassword),
              SizedBox(height: 20.0),
              streamBuilderContainer(),
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
      ),
    );
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

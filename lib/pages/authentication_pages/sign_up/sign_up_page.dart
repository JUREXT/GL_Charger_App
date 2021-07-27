import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/authentication_bloc.dart';
import 'package:gl_charge_app/network/modern_networking/register_response.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar_with_back_navigation.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_bottom_view.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_image_title.dart';
import 'package:gl_charge_app/stateless_widget_components/button_yellow.dart';
import 'package:gl_charge_app/stateless_widget_components/circular_loader.dart';
import 'package:gl_charge_app/stateless_widget_components/email_input.dart';
import 'package:gl_charge_app/stateless_widget_components/password_input.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/snack_bar.dart';
import 'package:gl_charge_app/utils/url_navigation.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

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

    registerClick() {
      var rand = Random();
      var shit = rand.nextInt(100).toString();
      print("Shit: " + shit);
      _authenticationBloc.register("username" + shit, "firstname" + shit, "lastname" + shit, shit + "test@test.si", "password" + shit); // TODO: HARD CODED FOR TEST
      // final form = _formKey.currentState;
      // if (form.validate()) {
      //   form.save();
      //   print("Email is valid $_email");
      //   print("Password is valid $_password");
      //   _authenticationBloc.signIn("lokovsek.jure@gmail.com", "123456Jl"); // TODO: HARD CODED FOR TEST
      // } else {
      //   print("Form is invalid");
      // }
    }

    Widget streamBuilderContainer() {
      return Container(
        child: StreamBuilder<ApiResponse<RegisterResponse>>(
          stream: _authenticationBloc.registerStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
                  print("LOADING");
                  return CircularLoader(text: "Registering", visibleProgress: true);
                  break;
                case Status.COMPLETED:
                  print("COMPLETED");
                  print("Navigate....");
                  return ButtonYellow(text: "Create an account", onPressed: () => registerClick());
                  break;
                case Status.ERROR:
                  print("ERROR");
                  WidgetsBinding.instance.addPostFrameCallback((_) => {
                    print("Show Error to user! :: " + snapshot.data.message),
                    showSnackBar(context, "Error Title", snapshot.data.message, 5),
                  });
                  return ButtonYellow(text: "Create an account", onPressed: () => registerClick());
                  break;
              }
            }
            print("DEFAULT");
            return ButtonYellow(text: "Create an account", onPressed: () => registerClick());
          },
        ),
      );
    }

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
            PasswordInput(hintText: "Create a strong password", labelText: "Your password"),
            PasswordInput(hintText: "Repeat password", labelText: "Repeat password"),
            streamBuilderContainer(),
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
    Get.back();
  }

  privacyClick() {
    print("privacyClick");
    UrlNavigation.navigateTo(context, Constants.privacyPolicyUrl);
  }

  signInActionClick() {
    print("signActionClick");
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/authentication_bloc.dart';
import 'package:gl_charge_app/network/modern_networking/sign_in_response.dart';
import 'package:gl_charge_app/network/modern_networking/testing/test_obj.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_in/sign_in_controller.dart';
import 'package:gl_charge_app/routes/app_pages.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar_with_back_navigation.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_bottom_view.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_image_title.dart';
import 'package:gl_charge_app/stateless_widget_components/button_yellow.dart';
import 'package:gl_charge_app/stateless_widget_components/circular_loader.dart';
import 'package:gl_charge_app/stateless_widget_components/email_input.dart';
import 'package:gl_charge_app/stateless_widget_components/password_input.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/Navigation.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/snack_bar.dart';
import 'package:gl_charge_app/utils/url_navigation.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final tag = "SignInPage";
  final controller = Get.find<SignInController>();

  final _formKey = new GlobalKey<FormState>();
  TextEditingController controllerPassword = new TextEditingController();
  String _email, _password;
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc();
  //  controller.increment();
  }

  @override
  Widget build(BuildContext context) {

    signInClick() {
      Log.i(tag, "signInClick");
      controller.signIn("lokovsek.jure@gmail.com", "123456Jl");
      // final form = _formKey.currentState;
      // if (form.validate()) {
      //   form.save();
      //   Log.i(tag, "Email is valid $_email");
      //   Log.i(tag,"Password is valid $_password");
      //   _authenticationBloc.signIn("lokovsek.jure@gmail.com", "123456Jl"); // TODO: HARD CODED FOR TEST
      // } else {
      //   print("Form is invalid");
      // }
    }

    Widget reactiveContainer() {
      return Container(
          child: GetX<SignInController>(
            builder: (_) {
              var result = controller.apiSignInResponse;
              switch(result.value.status) {
                case Status.IDLE:
                  Log.i(tag, "IDLE");
                 return ButtonYellow(text: "Continue", onPressed: () => signInClick());
                  break;
                case Status.LOADING:
                  Log.i(tag, "LOADING");
                  return CircularLoader(text: "Signing In...", visibleProgress: true);
                  break;
                case Status.SUCCESS:
                  var ok = result.value.data as TestObj;
                  Log.i(tag, "SUCCESS : " + ok.id.toString());
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                     Navigation.toNamed(Routes.SELECT_CHARGER, null);
                  });
                  return ButtonYellow(text: "Continue", onPressed: () => { });
                  break;
                case Status.ERROR:
                  var status = ""; // result.value.data as bool;
                  var message = result.value.message;
                  Log.i(tag, "ERROR : " + status.toString() + " Message: " + message);
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                     Get.snackbar("Problem Signing In", message);
                  });
                  return ButtonYellow(text: "Continue", onPressed: () => signInClick());
                  break;
              }
              return ButtonYellow(text: "Continue", onPressed: () => signInClick());
            },
          ));
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
              reactiveContainer(),
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
                  onActionCallback: () => signUpActionClick()),
            ],
          ),
        ),
      ),
    );
  }

  privacyClick() {
    Log.i(tag, "privacyClick");
    UrlNavigation.navigateTo(context, Constants.privacyPolicyUrl);
  }

  signUpActionClick() {
    Log.i(tag, "signUpActionClick");
    Navigation.toNamed(Routes.SIGN_UP, null);
  }

  forgotPasswordClick() {
    Log.i(tag, "forgotPasswordClick");
    Navigation.toNamed(Routes.FORGOT_PASSWORD, "test");
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/network/models/forgot_password_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/routes/app_pages.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar_with_back_navigation.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_bottom_view.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_image_title.dart';
import 'package:gl_charge_app/stateless_widget_components/button_yellow.dart';
import 'package:gl_charge_app/stateless_widget_components/circular_loader.dart';
import 'package:gl_charge_app/stateless_widget_components/email_input.dart';
import 'package:gl_charge_app/utils/navigation.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/delay_helper.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/url_navigation.dart';

import 'forgot_password_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final tag = "ForgotPasswordPage";
  final controller = Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {

    var data = Get.arguments;
    Log.d(tag, "Passed Data: $data");

    forgotPasswordInClick() {
      Log.i(tag, "signInClick");
      controller.forgotPassword("lokovsek.jure@gmail.com");
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
          child: GetX<ForgotPasswordController>(
            builder: (_) {
              var result = controller.apiForgotPasswordResponse;
              switch(result.value.status) {
                case Status.IDLE:
                  Log.i(tag, "IDLE");
                  return ButtonYellow(text: "Continue", onPressed: () => forgotPasswordInClick());
                  break;
                case Status.LOADING:
                  Log.i(tag, "LOADING");
                  return CircularLoader(text: "Resetting password...", visibleProgress: true);
                  break;
                case Status.SUCCESS:
                  var forgotPasswordRes = result.value.data as ForgotPasswordResponseModel;
                  Log.i(tag, "SUCCESS : " + forgotPasswordRes.success.toString());
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                    Get.snackbar("Password reset completed", "Check your email!");
                    await DelayHelper.delay(3);
                    Navigation.toNamed(Routes.SIGN_IN, null); // TODO: pass email back to sign in
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
                  return ButtonYellow(text: "Continue", onPressed: () => forgotPasswordInClick());
                  break;
              }
              return ButtonYellow(text: "Continue", onPressed: () => forgotPasswordInClick());
            },
          ));
    }

    return WillPopScope(
      onWillPop: () async => backPressed(),
      child: Scaffold(
        backgroundColor: Constants.ColorLightGrey,
        appBar: AppBarWithBackNavigation(onNavigateBackCallback: () => navigateBackClick()),
        body: SingleChildScrollView(
          child: Column(
            children: [
             // SizedBox(height: 20),
              AuthScreenImageTitle(title: "Forgot Password"),
              SizedBox(height: 100),
              EmailInput(hintText: "your@gmail.com", labelText: "Your Email", autofocus: false, onValueCallback: (email) => { print("Entered Email $email") }),
              reactiveContainer(),
              SizedBox(height: 100),
              AuthScreenBottomView(
                  accountText: "Already have an account?",
                  accountClickText: "Sign In",
                  privacyText1: "By signing up you agree to our ",
                  privacyText2: "Privacy Policy and Terms",
                  onPrivacyCallback: () => privacyClick(),
                  onActionCallback: () => actionSignInClick()),
            ],
          ),
        ),
      ),
    );
  }

  navigateBackClick() {
    Log.i(tag, "navigateBackClick");
    Navigation.back(null);
  }

  resetPasswordClick() {
    Log.i(tag, "resetPasswordClick");
  }

  privacyClick() {
    Log.i(tag, "privacyClick");
    UrlNavigation.navigateTo(context, Constants.privacyPolicyUrl);
  }

  actionSignInClick() {
    Log.i(tag, "navigateBackClick");
    Navigation.toNamed(Routes.SIGN_IN, null);
  }

  backPressed() {
    Log.i(tag, "backPressed");
    Navigation.back(null);
  }
}

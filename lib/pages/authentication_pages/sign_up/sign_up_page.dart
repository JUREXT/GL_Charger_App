import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/network/models/register_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_up/sign_up_controller.dart';
import 'package:gl_charge_app/routes/app_pages.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar_with_back_navigation.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_bottom_view.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_image_title.dart';
import 'package:gl_charge_app/stateless_widget_components/button_yellow.dart';
import 'package:gl_charge_app/stateless_widget_components/circular_loader.dart';
import 'package:gl_charge_app/stateless_widget_components/email_input.dart';
import 'package:gl_charge_app/stateless_widget_components/password_input.dart';
import 'package:gl_charge_app/utils/navigation.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/delay_helper.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/snack_bar.dart';
import 'package:gl_charge_app/utils/url_navigation.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final tag = "SignUpPage";
  final controller = Get.find<SignUpController>();

  var _emailTextController = TextEditingController(text: "");
  var _passwordTextController = TextEditingController(text: "");
  var _passwordRepeatTextController = TextEditingController(text: "");
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    registerClick() async {
      Log.i(tag, "registerClick");
       var rand = Random();
       var randInt = rand.nextInt(100).toString();
      // controller.register("username" + randInt, "firstname" + randInt, "lastname" + randInt, randInt + "test@test.si", "password" + randInt);
      if (_formKey.currentState.validate() && _passwordTextController.text == _passwordRepeatTextController.text) {
        await controller.register("username" + randInt, "firstname" + randInt, "lastname" + randInt, _emailTextController.text, _passwordTextController.text); // username, firstname, lastname, email, password // TODO: needs api updated
      } else {
        Log.d(tag, "Input forms not valid!");
      }
    }

    Widget reactiveContainer() {
      return Container(
          child: GetX<SignUpController>(
            builder: (_) {
              var result = controller.apiRegisterResponse;
              switch(result.value.status) {
                case Status.IDLE:
                  Log.i(tag, "IDLE");
                  return ButtonYellow(text: "Create an account", onPressed: () => registerClick());
                  break;
                case Status.LOADING:
                  Log.i(tag, "LOADING");
                  return CircularLoader(text: "Registering...", visibleProgress: true);
                  break;
                case Status.SUCCESS:
                  var registerRes = result.value.data as RegisterResponseModel;
                  Log.i(tag, "SUCCESS : " + registerRes.success.toString());
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                    Get.snackbar("Account created", "You can sign in now!");
                    await DelayHelper.delay(3);
                    Navigation.toNamed(Routes.SIGN_IN, null); // TODO: pass email back to sign in
                  });
                  return ButtonYellow(text: "Create an account", onPressed: () => { });
                  break;
                case Status.ERROR:
                  var status = ""; // result.value.data as bool;
                  var message = result.value.message;
                  Log.i(tag, "ERROR : " + status.toString() + " Message: " + message);
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    Get.snackbar("Problem Registering", message);
                  });
                  return ButtonYellow(text: "Create an account", onPressed: () => registerClick());
                  break;
              }
              return ButtonYellow(text: "Create an account", onPressed: () => registerClick());
            },
          ));
    }

    return WillPopScope(
      onWillPop: () async => backPressed(),
      child: Scaffold(
        backgroundColor: Constants.ColorLightGrey,
        appBar: AppBarWithBackNavigation(onNavigateBackCallback: () => navigateBackClick()),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Obx(() {
              return Column(
              children: [
                AuthScreenImageTitle(title: "Create and account"),
                SizedBox(height: 20),
                EmailInput(hintText: "your@gmail.com", labelText: "Your Email", autofocus: false, onValueCallback: (value) => { }, formEnabled: controller.inputFormEnabled.value, controller: _emailTextController),
                PasswordInput(hintText: "Create a strong password", labelText: "Your password", autofocus: false, onValueCallback: (value) => { }, formEnabled: controller.inputFormEnabled.value , controller: _passwordTextController),
                PasswordInput(hintText: "Repeat password", labelText: "Repeat password", autofocus: false, onValueCallback: (value) => { }, formEnabled: controller.inputFormEnabled.value , controller: _passwordRepeatTextController),
                SizedBox(height: 20),
                reactiveContainer(),
                //SizedBox(height: 30), // TODO: updated this on other screens
                AuthScreenBottomView(
                    accountText: "Already have an account?",
                    accountClickText: "Sign In",
                    privacyText1: "By signing up you agree to our ",
                    privacyText2: "Privacy Policy and Terms",
                    onPrivacyCallback: () => privacyClick(),
                    onActionCallback: () => signInActionClick()),
                  ],
                );
              }),
            ),
          ),
        ));
  }

  navigateBackClick() {
    Log.i(tag, "navigateBackClick");
    Navigation.back(null);
  }

  privacyClick() {
    Log.i(tag, "privacyClick");
    UrlNavigation.navigateTo(context, Constants.privacyPolicyUrl);
  }

  signInActionClick() {
    Log.i(tag, "signInActionClick");
    Navigation.toNamed(Routes.SIGN_IN, null);
  }

  backPressed() {
    Log.i(tag, "backPressed");
    Navigation.back(null);
  }
}

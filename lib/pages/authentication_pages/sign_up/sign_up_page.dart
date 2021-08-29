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
                  return ButtonYellow(text: "create_account".tr, onPressed: () => registerClick());
                  break;
                case Status.LOADING:
                  Log.i(tag, "LOADING");
                  return CircularLoader(text: "registering".tr, visibleProgress: true);
                  break;
                case Status.SUCCESS:
                  var registerRes = result.value.data as RegisterResponseModel;
                  Log.i(tag, "SUCCESS : " + registerRes.success.toString());
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                    Get.snackbar("account_created".tr, "account_created_sign_in".tr);
                    await DelayHelper.delay(3);
                    Navigation.toNamed(Routes.SIGN_IN, null); // TODO: pass email back to sign in
                  });
                  return ButtonYellow(text: "create_account".tr, onPressed: () => { });
                  break;
                case Status.ERROR:
                  var status = ""; // result.value.data as bool;
                  var message = result.value.message;
                  Log.i(tag, "ERROR : " + status.toString() + " Message: " + message);
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    Get.snackbar("problem_registering".tr, "");
                  });
                  return ButtonYellow(text: "create_account".tr, onPressed: () => registerClick());
                  break;
              }
              return ButtonYellow(text: "create_account".tr, onPressed: () => registerClick());
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
                SizedBox(height: 30),
                AuthScreenImageTitle(title: "create_an_account".tr),
                SizedBox(height: 30),
                EmailInput(hintText: "your_email_hint".tr, labelText: "your_email".tr, autofocus: false, onValueCallback: (value) => { }, formEnabled: controller.inputFormEnabled.value, controller: _emailTextController),
                PasswordInput(hintText: "create_strong_password_hint".tr, labelText: "your_password".tr, autofocus: false, onValueCallback: (value) => { }, formEnabled: controller.inputFormEnabled.value , controller: _passwordTextController),
                PasswordInput(hintText: "repeat_password_hint".tr, labelText: "repeat_password".tr, autofocus: false, onValueCallback: (value) => { }, formEnabled: controller.inputFormEnabled.value , controller: _passwordRepeatTextController),
                reactiveContainer(),
                SizedBox(height: 20),
                AuthScreenBottomView(
                    accountText: "already_account".tr,
                    accountClickText: "sign_up".tr,
                    privacyText1: "privacy_policy_1".tr,
                    privacyText2: "privacy_policy_2".tr,
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

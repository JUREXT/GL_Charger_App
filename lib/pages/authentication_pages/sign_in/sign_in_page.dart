import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/testing/test_obj.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_in/sign_in_controller.dart';
import 'package:gl_charge_app/routes/app_pages.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar_with_back_navigation.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_bottom_view.dart';
import 'package:gl_charge_app/stateless_widget_components/auth_screen_image_title.dart';
import 'package:gl_charge_app/stateless_widget_components/button_text.dart';
import 'package:gl_charge_app/stateless_widget_components/button_yellow.dart';
import 'package:gl_charge_app/stateless_widget_components/circular_loader.dart';
import 'package:gl_charge_app/stateless_widget_components/email_input.dart';
import 'package:gl_charge_app/stateless_widget_components/password_input.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/navigation.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/url_navigation.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final tag = "SignInPage";
  final controller = Get.find<SignInController>();

  var _emailTextController = TextEditingController(text: "");
  var _passwordTextController = TextEditingController(text: "");
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    signInClick() async {
      Log.i(tag, "signInClick");
      // await controller.signIn("lokovsek.jure@gmail.com", "123456Jl");
      if (_formKey.currentState.validate()) {
        await controller.signIn(_emailTextController.text, _passwordTextController.text);
      } else {
        Log.d(tag, "Input forms not valid!");
      }
    }

    Widget reactiveContainer() {
      return Container(
          child: GetX<SignInController>(
            builder: (_) {
              var result = controller.apiSignInResponse;
              switch(result.value.status) {
                case Status.IDLE:
                  Log.i(tag, "IDLE");
                  ButtonYellow(text: "continue".tr, onPressed: () => signInClick());
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
                  return ButtonYellow(text: "continue".tr, onPressed: () => {});
                  break;
                case Status.ERROR:
                  var status = ""; // result.value.data as bool;
                  var message = result.value.message;
                  Log.i(tag, "ERROR : " + status.toString() + " Message: " + message);
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                     Get.snackbar("Problem Signing In", message);
                  });
                  return ButtonYellow(text: "continue".tr, onPressed: () => signInClick());
                  break;
              }
              return ButtonYellow(text: "continue".tr, onPressed: () => signInClick());
            },
          ));
    }

    return Scaffold(
      backgroundColor: Constants.ColorLightGrey,
      appBar: AppBarWithBackNavigation(backIconVisible: false),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Obx(() {
          return Column(
            children: [
             // SizedBox(height: 20),
              AuthScreenImageTitle(title: "Sign In"),
              SizedBox(height: 30),
              EmailInput(hintText: "your@gmail.com", labelText: "Your Email", autofocus: false, onValueCallback: (value) => { }, formEnabled: controller.inputFormEnabled.value, controller: _emailTextController),
              PasswordInput(hintText: "Create a strong password", labelText: "Your password", autofocus: false, onValueCallback: (value) => { }, formEnabled: controller.inputFormEnabled.value , controller: _passwordTextController),
              reactiveContainer(),
              SizedBox(height: 10),
              Align(alignment: Alignment.centerLeft, child: ButtonText(text: "Forgot password?", onPressed: () => forgotPasswordClick())),
              SizedBox(height: 20),
              AuthScreenBottomView(
                  accountText: "Don't have account?",
                  accountClickText: "Sign Up",
                  privacyText1: "By signing up you agree to our ",
                  privacyText2: "Privacy Policy and Terms",
                  onPrivacyCallback: () => privacyClick(),
                  onActionCallback: () => signUpActionClick()),
                ],
              );
            }),
          ),
        ));
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

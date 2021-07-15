import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/components/app_bar1.dart';
import 'package:gl_charge_app/screens/main_tabs_screen_holder.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/components/button_black.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar1(title: "Test Screen"),
      backgroundColor: Constants.ColorLightGrey,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ButtonBlack(
                text: "Go To Main Screen",
                onPressed: () {
                  Route route =
                  MaterialPageRoute(builder: (context) => MainTabsScreenHolder());
                  Navigator.pushReplacement(context, route);
                }),
          ],
        ),
      ),
    );
  }
}

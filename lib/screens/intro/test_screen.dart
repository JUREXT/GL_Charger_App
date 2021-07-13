import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/screens/main_tabs_screen_holder.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBar1.dart';
import 'package:gl_charge_app/widgets/appChargerListItem.dart';
import 'package:gl_charge_app/widgets/appCustomButtonBlack.dart';
import 'package:gl_charge_app/widgets/appSimpleSnackBar.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1("Test Screen"),
      backgroundColor: Constants.ColorLightGrey,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            AppCustomButtonBlack(
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

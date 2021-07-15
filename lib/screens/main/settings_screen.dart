import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/authentication/sign_in_page.dart';
import 'package:gl_charge_app/components/app_bar1.dart';
import 'package:gl_charge_app/components/settings_divider.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appText.dart';
import 'package:provider/provider.dart';
import '../../utils/constants.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar1(title: 'Settings'),
      backgroundColor: Constants.ColorLightGrey,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[

            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: appText("General Settings", 15.0, Constants.ColorWhite, TextDecoration.none),
            ),
            SettingsDivider(),

            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: appText("Account Settings", 15.0, Constants.ColorWhite, TextDecoration.none),
            ),
            SettingsDivider(),

            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: appText("Notifications", 15.0, Constants.ColorWhite, TextDecoration.none),
              trailing: Consumer<ThemeNotifier>(
                builder: (context, notifier, child) => CupertinoSwitch(
                  onChanged: (val) {
                    notifier.toggleTheme();
                  },
                  value: notifier.dark,
                  activeColor: Constants.ColorYellow,
                  trackColor: Constants.ColorLightPurple,
                ),
              ),
            ),
            SettingsDivider(),

            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: appText("Default Charger", 15.0, Constants.ColorWhite, TextDecoration.none),
            ),
            SettingsDivider(),

            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: appText("Default Charging method", 15.0, Constants.ColorWhite, TextDecoration.none),
            ),
            SettingsDivider(),

            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: appText("Authentication", 15.0, Constants.ColorWhite, TextDecoration.none),
            ),
            SettingsDivider(),

            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: appText("Logout", 15.0, Constants.ColorWhite, TextDecoration.none),
                onTap: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
                  Route route = MaterialPageRoute(builder: (context) => SignInPage());
                  Navigator.pushReplacement(context, route);
                  //Navigator.pop(context);
                }
            ),
            SettingsDivider(),

          ],
        ),
      ),
    );
  }
}

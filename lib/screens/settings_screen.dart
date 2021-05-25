import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBar1.dart';
import 'package:gl_charge_app/widgets/appSettingsDivider.dart';
import 'package:gl_charge_app/widgets/appSettingsListTile.dart';
import 'package:gl_charge_app/widgets/appText.dart';
import 'package:provider/provider.dart';

import '../authentication/log_in/login_page.dart';
import '../utils/constants.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1("Settings"),
      backgroundColor: Constants.ColorLightGrey,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[

            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: appText("General Settings", 15.0, Constants.ColorWhite, TextDecoration.none),
            ),
            appSettingsDivider(),

            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: appText("Account Settings", 15.0, Constants.ColorWhite, TextDecoration.none),
            ),
            appSettingsDivider(),

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
            appSettingsDivider(),

            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: appText("Default Charger", 15.0, Constants.ColorWhite, TextDecoration.none),
            ),
            appSettingsDivider(),

            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: appText("Default Charging method", 15.0, Constants.ColorWhite, TextDecoration.none),
            ),
            appSettingsDivider(),

            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: appText("Authentication", 15.0, Constants.ColorWhite, TextDecoration.none),
            ),
            appSettingsDivider(),
            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: appText("Logout", 15.0, Constants.ColorWhite, TextDecoration.none),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage()));
                }
            ),
            appSettingsDivider(),

          ],
        ),
      ),
    );
  }
}

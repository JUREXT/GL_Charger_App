import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBar1.dart';
import 'package:gl_charge_app/widgets/appSettingsDivider.dart';
import 'package:gl_charge_app/widgets/appSettingsListTile.dart';
import 'package:gl_charge_app/widgets/appText.dart';
import 'package:provider/provider.dart';

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

            Container(
                child: appSettingsListTile("General Settings"), height: 65),
            appSettingsDivider(),
            SizedBox(height: 2.0),
            Container(
                child: appSettingsListTile("Account Settings"), height: 65),
            appSettingsDivider(),
            SizedBox(height: 2.0),
            ListTile(
              leading: Icon(Icons.settings),
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
            SizedBox(height: 2.0),
            Container(
                child: appSettingsListTile("Default Charger"), height: 65),
            appSettingsDivider(),
            SizedBox(height: 2.0),
            Container(
                child: appSettingsListTile("Default Charging method"),
                height: 65),
            appSettingsDivider(),
            SizedBox(height: 2.0),
            Container(child: appSettingsListTile("Authentication"), height: 65),
          ],
        ),
      ),
    );
  }
}

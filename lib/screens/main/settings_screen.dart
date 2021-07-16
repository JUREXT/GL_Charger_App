import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/authentication/sign_in_page.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar1.dart';
import 'package:gl_charge_app/stateless_widget_components/settings_divider.dart';
import 'package:gl_charge_app/stateless_widget_components/settings_list_item.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';
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

            SettingsListItem(title: "General Settings", onSettingsItemCallback: () => { print("General Settings Clicked") }),
            SettingsDivider(),

            SettingsListItem(title: "Account Settings", onSettingsItemCallback: () => { print("Account Settings Clicked") }),
            SettingsDivider(),

            ListTile(
              leading: Icon(Icons.settings, color: Constants.ColorYellow),
              title: TextCustom(text: "Notifications", textSize: 15.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none),
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

            SettingsListItem(title: "Default Charger", onSettingsItemCallback: () => { print("Default Charger Clicked") }),
            SettingsDivider(),

            SettingsListItem(title: "Default Charging method", onSettingsItemCallback: () => { print("Default Charging method Clicked") }),
            SettingsDivider(),

            SettingsListItem(title: "Authentication", onSettingsItemCallback: () => { print("Authentication Clicked") }),
            SettingsDivider(),

            SettingsListItem(title: "Logout", onSettingsItemCallback: () {
              print("Logout Clicked");
            Route route = MaterialPageRoute(builder: (context) => SignInPage());
                Navigator.pushReplacement(context, route);
            }),
            SettingsDivider(),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/pages/main_views/settings/settings_controller.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar1.dart';
import 'package:gl_charge_app/stateless_widget_components/settings_divider.dart';
import 'package:gl_charge_app/stateless_widget_components/settings_list_item.dart';
import 'package:gl_charge_app/translations/app_translations.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/storage.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  final tag = "SettingScreen";
  final controller = Get.find<SettingsController>();

  showLocaleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("choose_lang".tr),
              content: Container(
                width: double.maxFinite,
                child: ListView.separated(
                  shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(AppTranslation.locales[index]["name"]),
                          ),
                          onTap: () async => {
                            updatedLocale(AppTranslation.locales[index]["locale"], context),
                            await Storage().setLocale(AppTranslation.locales[index]["name"])
                          },
                        ),
                    separatorBuilder: (context, index) => SettingsDivider(),
                    itemCount: 2),
              ),
            ));
  }

  updatedLocale(Locale l, BuildContext ctx) {
    Navigator.of(ctx).pop();
    Get.updateLocale(l);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar1(title: 'title_settings'.tr),
        backgroundColor: Constants.ColorLightGrey,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[

              // SettingsListItem(title: "General Settings", onSettingsItemCallback: () => { print("General Settings Clicked") }),
              // SettingsDivider(),
              //
              // SettingsListItem(title: "Account Settings", onSettingsItemCallback: () => { print("Account Settings Clicked") }),
              // SettingsDivider(),
              //
              // ListTile(
              //   leading: Icon(Icons.settings, color: Constants.ColorYellow),
              //   title: TextCustom(text: "Notifications", textSize: 15.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none),
              //   trailing: Consumer<ThemeNotifier>(
              //     builder: (context, notifier, child) => CupertinoSwitch(
              //       onChanged: (val) {
              //         notifier.toggleTheme();
              //       },
              //       value: notifier.dark,
              //       activeColor: Constants.ColorYellow,
              //       trackColor: Constants.ColorLightPurple,
              //     ),
              //   ),
              // ),
              // SettingsDivider(),
              //
              // SettingsListItem(title: "Default Charger", onSettingsItemCallback: () => { print("Default Charger Clicked") }),
              // SettingsDivider(),
              //
              // SettingsListItem(title: "Default Charging method", onSettingsItemCallback: () => { print("Default Charging method Clicked") }),
              // SettingsDivider(),
              //
              // SettingsListItem(title: "Authentication", onSettingsItemCallback: () => { print("Authentication Clicked") }),
              // SettingsDivider(),

              SettingsListItem(title: "language".tr, onSettingsItemCallback: () => { showLocaleDialog(context) }),
              SettingsDivider(),

              SettingsListItem(title: "logout".tr, onSettingsItemCallback: () async => await controller.signOut()),
              SettingsDivider(),

            ],
          ),
        ),
      ),
    );
  }
}

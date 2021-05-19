import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';

import 'appText.dart';

Widget appSettingsListTile(String title) {
  return ListTile(
    leading: Icon(Icons.settings),
    title: appText(title, 15.0, Constants.ColorWhite, TextDecoration.none),
  );
}
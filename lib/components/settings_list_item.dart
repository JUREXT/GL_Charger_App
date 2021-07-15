import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appText.dart';

class SettingsListItem extends StatelessWidget {
  
  final VoidCallback onSettingsItemCallback;
  final String title;

  const SettingsListItem({Key key, @required this.onSettingsItemCallback, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.settings, color: Constants.ColorYellow),
      title: appText(title, 15.0, Constants.ColorWhite, TextDecoration.none),
      onTap: () => onSettingsItemCallback(),
    );
  }
}

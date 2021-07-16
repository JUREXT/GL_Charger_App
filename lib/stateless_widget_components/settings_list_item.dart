import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';

class SettingsListItem extends StatelessWidget {

  final VoidCallback onSettingsItemCallback;
  final String title;

  const SettingsListItem({Key key, @required this.onSettingsItemCallback, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.settings, color: Constants.ColorYellow),
      title: TextCustom(text: title, textSize: 15.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none),
      onTap: () => onSettingsItemCallback(),
    );
  }
}

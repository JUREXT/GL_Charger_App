import 'package:flutter/material.dart';
import '../utils/constants.dart';

class SettingsDivider extends StatelessWidget {

  final double dividerHeight;
  final Color dividerColor;

  SettingsDivider({Key key, this.dividerHeight = 3.0, this.dividerColor = Constants.ColorDivider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(height: dividerHeight, color: dividerColor);
  }
}

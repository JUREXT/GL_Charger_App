import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AppBar1 extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  const AppBar1({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constants.ColorLightGrey,
      title: Text(title, style: TextStyle(fontSize: 24.0, color: Constants.ColorWhite)),
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
          child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(color: Constants.ColorYellow, height: 2.0)),
          preferredSize: Size.fromHeight(60.0)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'appText.dart';

Widget appUserListItem() {
  return Container(
    height: 76,
    decoration: BoxDecoration(
        color: Constants.ColorBlack,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: ListTile(
      leading: Container(child: CircleAvatar(child: Image.asset('assets/images/ic_user.png'), backgroundColor: Constants.ColorYellow)),
      title: appText("Urban Matko", 15.0, Constants.ColorWhite, TextDecoration.none),
      subtitle: appText("ID: 12458931", 12, Constants.ColorLightPurple, TextDecoration.none),
      trailing: Wrap(
        spacing: 18, // space between two icons
        children: <Widget>[
          Container(child: CircleAvatar(child: Image.asset('assets/images/ic_done_24px.png'), backgroundColor: Constants.ColorLightGreen)),
          Container(child: CircleAvatar(child: Image.asset('assets/images/ic_clear_24px.png'), backgroundColor: Constants.ColorRed)),
        ],
      ),
    )
  );
}

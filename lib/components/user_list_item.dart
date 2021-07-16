import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/components/text_custom.dart';
import 'package:gl_charge_app/models/user.dart';
import 'package:gl_charge_app/utils/constants.dart';

class UserListItem extends StatelessWidget {

  final UserModel user;
  final Function(UserModel) onSelectedUserCallback;

  const UserListItem({Key key, @required this.user, @required this.onSelectedUserCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectedUserCallback(user);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Container(
            height: 76,
            decoration: BoxDecoration(
                color: Constants.ColorBlack,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListTile(
              leading: Container(child: CircleAvatar(child: Image.asset('assets/images/ic_user.png'), backgroundColor: Constants.ColorYellow)),
              title: TextCustom(text: user.nameSurname, textSize: 15.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none),
              subtitle: TextCustom(text: "ID: " + user.id, textSize: 12.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none),
              trailing: Wrap(
                spacing: 18, // space between two icons
                children: <Widget>[
                  Container(child: CircleAvatar(child: Image.asset('assets/images/ic_done_24px.png'), backgroundColor: Constants.ColorLightGreen)),
                  Container(child: CircleAvatar(child: Image.asset('assets/images/ic_clear_24px.png'), backgroundColor: Constants.ColorRed)),
                ],
              ),
            )
        ),
      ),
    );
  }
}

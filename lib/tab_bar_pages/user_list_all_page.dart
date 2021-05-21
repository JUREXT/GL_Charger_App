import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appUserListItem.dart';

class UserListAllPage extends StatefulWidget {
  @override
  _UserListAllPageState createState() => _UserListAllPageState();
}

class _UserListAllPageState extends State<UserListAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.ColorLightGrey,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            appUserListItem(),
            SizedBox(height: 20.0),
            appUserListItem(),
            SizedBox(height: 20.0),
            appUserListItem(),
            SizedBox(height: 20.0),
            appUserListItem(),
            SizedBox(height: 20.0),
            appUserListItem(),
            SizedBox(height: 20.0),
            appUserListItem(),
            SizedBox(height: 20.0),
            appUserListItem(),
            SizedBox(height: 20.0),
            appUserListItem(),
            SizedBox(height: 20.0),
            appUserListItem(),
            SizedBox(height: 20.0),

          ],
        ),
      ),
    );
  }
}

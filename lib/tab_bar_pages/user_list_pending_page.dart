import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appText.dart';
import 'package:gl_charge_app/widgets/appUserListItem.dart';

class UserListPendingPage extends StatefulWidget {
  @override
  _UserListPendingPageState createState() => _UserListPendingPageState();
}

// https://mightytechno.com/rounded-button-flutter/

class _UserListPendingPageState extends State<UserListPendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.ColorLightGrey,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: RawScrollbar(
          thumbColor: Constants.ColorYellow,
          radius: Radius.circular(20),
          thickness: 3,
          isAlwaysShown: true,
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
      ),
    );
  }
}

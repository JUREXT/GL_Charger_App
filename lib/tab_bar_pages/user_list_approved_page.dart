import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appUserListItem.dart';

class UserListApprovedPage extends StatefulWidget {
  @override
  _UserListApprovedPageState createState() => _UserListApprovedPageState();
}

// https://mightytechno.com/rounded-button-flutter/

class _UserListApprovedPageState extends State<UserListApprovedPage> {
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

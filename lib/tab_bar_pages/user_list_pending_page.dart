import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/components/user_list_item.dart';
import 'package:gl_charge_app/models/FakeData.dart';
import 'package:gl_charge_app/models/user.dart';
import 'package:gl_charge_app/utils/constants.dart';

class UserListPendingPage extends StatefulWidget {
  @override
  _UserListPendingPageState createState() => _UserListPendingPageState();
}

// https://mightytechno.com/rounded-button-flutter/

class _UserListPendingPageState extends State<UserListPendingPage> {

  List<UserModel> list = listOfUsersFake;

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
          child: Scrollbar(
            thickness: 5,
            isAlwaysShown: false,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return UserListItem(
                  user: list[index],
                  onSelectedUserCallback: (UserModel charger) {
                    print("onSelectedUserCallback: " + charger.toString());
                    //navigate(context);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
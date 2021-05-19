import 'package:flutter/material.dart';
import 'dart:async';

import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBar1.dart';

class UsersScreen extends StatefulWidget {
  UsersScreen({Key key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1("User List"),
      backgroundColor: Constants.ColorLightGrey,

    );
  }
}

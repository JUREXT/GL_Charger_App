import 'package:flutter/material.dart';
import 'package:gl_charge_app/tab_bar_pages/user_lits_page.dart';
import 'dart:async';

import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBar1.dart';
import 'package:gl_charge_app/widgets/appText.dart';

class UsersScreen extends StatefulWidget {
  UsersScreen({Key key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: PreferredSize(
              child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Text("User List", style: TextStyle(fontSize: 24.0, color: Constants.lightBG)),
                      Container(color: Colors.orange, height: 2.0),
                    ],
                  )),
              preferredSize: Size.fromHeight(5.0)),
          bottom: TabBar(
            indicatorWeight: 2,
            isScrollable: false,
            indicatorColor: Constants.ColorYellow,
            unselectedLabelColor: Constants.ColorBlack,
            tabs: [
              Tab(child: appText("ALL", 14.0, Constants.ColorYellow, TextDecoration.none)),
              Tab(child: appText("PENDING", 14.0, Constants.ColorYellow, TextDecoration.none)),
              Tab(child: appText("APPROVED", 14.0, Constants.ColorYellow, TextDecoration.none)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            UserListPage(),
            Icon(Icons.transfer_within_a_station, size: 350),
            Icon(Icons.transfer_within_a_station, size: 350),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:gl_charge_app/tab_bar_pages/user_list_all_page.dart';
import 'package:gl_charge_app/tab_bar_pages/user_list_approved_page.dart';
import 'package:gl_charge_app/tab_bar_pages/user_list_pending_page.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appText.dart';

import '../utils/constants.dart';

class UserListScreen extends StatefulWidget {
  UserListScreen({Key key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.ColorBlack,
          title: PreferredSize(
              child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Text("User List", style: TextStyle(fontSize: 24.0, color: Constants.ColorWhite)),
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
            UserListAllPage(),
            UserListPendingPage(),
            UserListApprovedPage()
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:gl_charge_app/tab_bar_pages/user_list_all_page.dart';
import 'package:gl_charge_app/tab_bar_pages/user_list_approved_page.dart';
import 'package:gl_charge_app/tab_bar_pages/user_list_pending_page.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBar1.dart';
import 'package:gl_charge_app/widgets/appBar2.dart';
import 'package:gl_charge_app/widgets/appText.dart';

import '../../utils/constants.dart';

class UserListScreen extends StatefulWidget {
  UserListScreen({Key key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1("User List"),
      backgroundColor: Constants.ColorLightGrey,
      body: Padding(
       padding: EdgeInsets.all(10.0),
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: AppBar(
                backgroundColor: Constants.ColorBlack,
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
            ),
            body: TabBarView(
              children: [
                UserListAllPage(),
                UserListPendingPage(),
                UserListApprovedPage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
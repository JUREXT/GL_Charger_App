import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/screens/settings_screen.dart';
import 'package:gl_charge_app/screens/shop_screen.dart';
import 'package:gl_charge_app/screens/user_list_screen.dart';
import 'package:gl_charge_app/utils/constants.dart';

import 'charge_screen.dart';
import 'chargers_screen.dart';

class TabsScreenHolder extends StatefulWidget {
  @override
  _TabsScreenHolderState createState() => _TabsScreenHolderState();
}

class _TabsScreenHolderState extends State<TabsScreenHolder> {

  PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void whenOnTap(int index) {
    log("WhenOnTap Index: $index");
    currentIndex = index;
    _pageController.animateToPage(currentIndex,  duration: Duration(milliseconds: 200), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Constants.ColorBlack,
        selectedItemColor: Constants.ColorYellow,
        unselectedItemColor: Constants.ColorWhite, // TODO: needs to be ColorLightGrey, but not looking good
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: whenOnTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), // TODO: string need to be translated later
            label: "Users",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.battery_alert_sharp),
            label: "Chargers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_iridescent), // TODO: correct icon later
            label: "Charge",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: "Shop",
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: <Widget>[
          UserListScreen(),
          ChargersScreen(),
          ChargeScreen(),
          SettingScreen(),
          ShopScreen()
        ],
      ),
    );
  }
}
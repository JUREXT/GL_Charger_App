import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/pages/main_views/charge/charge_screen.dart';
import 'package:gl_charge_app/pages/main_views/chargers_screen/chargers_screen.dart';
import 'package:gl_charge_app/pages/main_views/settings/settings_screen.dart';
import 'package:gl_charge_app/pages/main_views/shop_screen.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';

import 'main_screen_holder_controller.dart';

class MainTabsScreenHolder extends StatefulWidget {
  @override
  _MainTabsScreenHolderState createState() => _MainTabsScreenHolderState();
}

class _MainTabsScreenHolderState extends State<MainTabsScreenHolder> {
  final tag = "MainTabsScreenHolder";
  final controller = Get.find<MainScreenHolderController>();


  PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void whenOnTap(int index) {
    log("WhenOnTap Index: $index");
    currentIndex = index;
    _pageController.animateToPage(currentIndex,  duration: Duration(milliseconds: Constants.switchSpeedMainTabsScreenHolder), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {

    var data = Get.arguments;
    Log.d(tag, "Passed Data: $data");

    return WillPopScope(
      onWillPop: () async => false, // TODO: this will disable back button press on android
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Constants.ColorBlack,
          selectedItemColor: Constants.ColorYellow,
          unselectedItemColor: Constants.ColorWhite, // TODO: needs to be ColorLightGrey, but not looking good
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: whenOnTap,
          items: [
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.account_circle),
            //   label: "Users", // TODO: string need to be translated later
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.battery_alert_sharp),
              label: "Chargers",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.power),
              label: "Charge",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.keyboard),
            //   label: "Dev Tools",
            // ),
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
           // UserListScreen(),
            ChargersScreen(),
            ChargeScreen(),
            SettingScreen(),
           // DevToolsScreen(),
            ShopScreen()
          ],
        ),
      ),
    );
  }
}
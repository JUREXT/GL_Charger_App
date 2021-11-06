import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/pages/main_views/charge/charge_controller.dart';
import 'package:gl_charge_app/pages/main_views/charge/charge_screen.dart';
import 'package:gl_charge_app/pages/main_views/chargers_screen/chargers_screen.dart';
import 'package:gl_charge_app/pages/main_views/session_history/charge_session_screen.dart';
import 'package:gl_charge_app/pages/main_views/settings/settings_screen.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'main_screen_holder_controller.dart';

class MainTabsScreenHolder extends StatefulWidget {
  @override
  _MainTabsScreenHolderState createState() => _MainTabsScreenHolderState();
}

class _MainTabsScreenHolderState extends State<MainTabsScreenHolder> {
  final tag = "MainTabsScreenHolder";

  MainScreenHolderController controllerMain = Get.find();
  ChargeController controllerCharge = Get.find();
  int currentIndex = 1;

  @override
  void dispose() {
    controllerMain.pageController.dispose();
    super.dispose();
  }

  void switchTabOnTap(int index) {
    Log.d(tag, "Tab Index: $index");
    currentIndex = index;
    controllerMain.switchTabToNewIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // TODO: this will disable back button press on android
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Constants.ColorBlack,
          selectedItemColor: Constants.ColorYellow,
          unselectedItemColor: Constants.ColorWhite, // TODO: needs to be ColorLightGrey, but not looking good
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => switchTabOnTap(index),
          items: [
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.account_circle),
            //   label: "Users",
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.battery_alert_sharp),
              label: "tab_chargers".tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.power),
              label: "tab_charge".tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "tab_charge_session_history".tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "tab_settings".tr,
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.keyboard),
            //   label: "Dev Tools",
            // ),

          ],
        ),
        body: PageView(
          controller: controllerMain.pageController,
          onPageChanged: (page) {
            setState(() {
              currentIndex = page;
            });
          },
          children: <Widget>[
           // UserListScreen(),
            ChargersScreen(),
            ChargeScreen(),
            ChargeSessionScreen(),
            SettingScreen(),
           // DevToolsScreen(),

           // ShopScreen()
          ],
        ),
      ),
    );
  }
}
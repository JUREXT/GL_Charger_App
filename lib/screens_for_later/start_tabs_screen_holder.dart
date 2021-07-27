import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'intro/select_charger_screen.dart';
import 'intro/test_screen.dart';

class StartTabsScreenHolder extends StatefulWidget {
  @override
  _StartTabsScreenHolderState createState() => _StartTabsScreenHolderState();
}

class _StartTabsScreenHolderState extends State<StartTabsScreenHolder> {

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
    _pageController.animateToPage(currentIndex,  duration: Duration(milliseconds: Constants.switchSpeedStartTabsScreenHolder), curve: Curves.linear);
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.qr_code),
          //   label: "Scan QR Code".toUpperCase(),
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ev_station_rounded),
            label: "Charger List".toUpperCase(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.developer_board),
            label: "Test Screen".toUpperCase(),
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
         // ScanQRCodeScreen(),
          SelectChargerScreen(),
          TestScreen(),
        ],
      ),
    );
  }
}
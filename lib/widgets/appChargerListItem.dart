import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';

import '../utils/constants.dart';
import 'appText.dart';

Widget appChargerListItem(String chargerName, bool isOnline, bool chargingState, String chargerLocation, String chargerId) {
  return Container(
    height: 150,
    decoration: BoxDecoration(
        color: Constants.ColorBlack,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Column(
      children: [
        ListTile(
          leading: Container(height: 60, width: 60, child: CircleAvatar(child: Image.asset('assets/images/charging_station.png'), backgroundColor: Constants.ColorYellow)),
          title: appText(chargerName, 15.0, Constants.ColorWhite, TextDecoration.none),
          subtitle: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Constants.ColorYellow,
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                // color: Constants.ColorYellow,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: appText(isOnline ? "ONLINE" : "OFFLINE", 12, Constants.ColorBlack, TextDecoration.none))),
              SizedBox(width: 5),
              appText(chargingState ? "Charging" : "Not Charging", 12, Constants.ColorYellow, TextDecoration.none),
            ],
          ),
        ),

        // SizedBox(height: 10),
        Expanded(
          child: Divider(height: 1, thickness: 1, indent: 16, endIndent: 16, color: Constants.ColorDivider2),
        ),

        ListTile(
          leading: Icon(Icons.location_on, color: Constants.ColorYellow),
          title: appText(chargerLocation, 15.0, Constants.ColorWhite, TextDecoration.none),
          subtitle: appText("Charger ID: $chargerId", 12.0, Constants.ColorLightPurple,  TextDecoration.none),
        ),
      ],
    ),
  );
}

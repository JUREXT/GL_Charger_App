import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';

import 'appText.dart';

Widget appChargerListItem() {
  return Container(
    height: 150,
    decoration: BoxDecoration(
        color: Constants.ColorBlack,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Constants.ColorYellow,
            backgroundImage: AssetImage('assets/charging_station.png'),
          ),
          title: appText(
              "Home Charger", 15.0, Constants.ColorWhite, TextDecoration.none),
          subtitle: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Constants.ColorYellow,
                    borderRadius: BorderRadius.all(Radius.circular(2))),
                // color: Constants.ColorYellow,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: appText(
                      "ONLINE", 12, Constants.ColorBlack, TextDecoration.none),
                ),
              ),
              //
              SizedBox(width: 5),
              appText(
                  "Charging", 12, Constants.ColorYellow, TextDecoration.none),
            ],
          ),
        ),

        // SizedBox(height: 10),
        Expanded(
          flex: 2,
          child: Divider(
            height: 1,
            thickness: 1,
            indent: 16,
            endIndent: 16,
            color: Constants.ColorDivider2,
          ),
        ),

        ListTile(
          leading: Icon(Icons.location_on),
          title: appText(
              "Ljubljana", 15.0, Constants.ColorWhite, TextDecoration.none),
          subtitle: appText(
              "Charger ID: 189894984",
              12.0,
              Constants.ColorLightPurple,
              TextDecoration
                  .none), //Text('93 million miles away'), //           <-- subtitle
        ),
      ],
    ),
  );
}

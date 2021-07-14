import 'package:flutter/material.dart';
import 'package:gl_charge_app/models/charger.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appText.dart';

import '../utils/constants.dart';

class ChargerListItem extends StatelessWidget {

  final ChargerModel charger;
  final Function(ChargerModel) onSelectedChargerCallback;
  final VoidCallback onSelectedVoidCallback;

  const ChargerListItem({@required this.charger, @required this.onSelectedChargerCallback, this.onSelectedVoidCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectedVoidCallback();
        onSelectedChargerCallback(charger);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 22.0),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              color: Constants.ColorBlack,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              ListTile(
                leading: Container(height: 60, width: 60, child: CircleAvatar(child: Image.asset('assets/images/charging_station.png'), backgroundColor: Constants.ColorYellow)),
                title: appText(charger.chargerName, 15.0, Constants.ColorWhite, TextDecoration.none),
                subtitle: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Constants.ColorYellow,
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        // color: Constants.ColorYellow,
                        child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: appText(charger.isOnline ? "ONLINE" : "OFFLINE", 12, Constants.ColorBlack, TextDecoration.none))),
                    SizedBox(width: 5),
                    appText(charger.chargingState ? "Charging" : "Not Charging", 12, Constants.ColorYellow, TextDecoration.none),
                  ],
                ),
              ),

              // SizedBox(height: 10),
              Expanded(
                child: Divider(height: 1, thickness: 1, indent: 16, endIndent: 16, color: Constants.ColorDivider2),
              ),

              ListTile(
                leading: Icon(Icons.location_on, color: Constants.ColorYellow),
                title: appText(charger.chargerLocation, 15.0, Constants.ColorWhite, TextDecoration.none),
                subtitle: appText("Max Power: " + charger.maxPower + " kW", 12.0, Constants.ColorLightPurple,  TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
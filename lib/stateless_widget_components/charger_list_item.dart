import 'package:flutter/material.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:get/get.dart';

class ChargerListItem extends StatelessWidget {

  final Charger charger;
  final Function(Charger) onSelectedChargerCallback;
  final bool reservedIconVisibility;
  final GestureTapCallback onReservedIconPressed;
  const ChargerListItem({@required this.charger, @required this.onSelectedChargerCallback, this.reservedIconVisibility, this.onReservedIconPressed});

  // Add click ripple -> https://flutter.dev/docs/cookbook/gestures/ripples
  // Add a click event to any widget of -> https://dev.to/rkowase/how-to-add-a-click-event-to-any-widget-of-flutter-2len

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                //trailing: Visibility(visible: true, child: Container(child: IconButton(icon: Icon(Icons.lock_outline), iconSize: 20, color: Colors.green))),
                trailing: Visibility(visible: reservedIconVisibility, child: Container(child: Material(color: Colors.transparent, child: IconButton(icon: Icon(Icons.lock_clock, color: Colors.white), onPressed: onReservedIconPressed)))),
                title: TextCustom(text: charger.name, textSize: 15.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none),
                subtitle: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Constants.ColorYellow,
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        // color: Constants.ColorYellow,
                        child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: TextCustom(text: charger.isOnline ? "charger_list_item_online".tr : "charger_list_item_off_online".tr, textSize: 12.0, textColor: Constants.ColorBlack, decoration: TextDecoration.none))),
                    SizedBox(width: 5),
                    TextCustom(text: charger.chargingState ? "charger_charging_state_true".tr : "charger_charging_state_false".tr, textSize: 12.0, textColor: Constants.ColorYellow, decoration: TextDecoration.none),
                  ],
                ),
              ),

              // SizedBox(height: 10),
              Expanded(
                child: Divider(height: 1, thickness: 1, indent: 16, endIndent: 16, color: Constants.ColorDivider2),
              ),

              ListTile(
                leading: Icon(Icons.location_on, color: Constants.ColorYellow),
                title: TextCustom(text: charger.chargerLocation , textSize: 15.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none),
                subtitle: TextCustom(text: "charger_max_power".tr + " ${charger.maxPower} " + "charger_max_power_unit".tr, textSize: 12.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/components/charger_list_item.dart';
import 'package:gl_charge_app/models/charger.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBar1.dart';

class ChargersScreen extends StatefulWidget {
  @override
  _ChargersScreenState createState() => _ChargersScreenState();
}

class _ChargersScreenState extends State<ChargersScreen> {

  List<ChargerModel> list = [
    ChargerModel(chargerName: "Home Charger 1",
        isOnline: true,
        chargingState: true,
        chargerLocation: "Ljubljana",
        maxPower: "1.5"),
    ChargerModel(chargerName: "Home Charger 2",
        isOnline: false,
        chargingState: true,
        chargerLocation: "Ljubljana",
        maxPower: "1.5"),
    ChargerModel(chargerName: "Home Charger 3",
        isOnline: true,
        chargingState: false,
        chargerLocation: "Ljubljana",
        maxPower: "1.5"),
    ChargerModel(chargerName: "Home Charger 4",
        isOnline: true,
        chargingState: false,
        chargerLocation: "Ljubljana",
        maxPower: "1.5"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1("Chargers"),
      backgroundColor: Constants.ColorLightGrey,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ChargerListItem(
              charger: list[index],
              onSelectedVoidCallback: () => print("onSelectedVoidCallback"),
              onSelectedChargerCallback: (ChargerModel charger) {
                print("onSelectedChargerCallback: " + charger.toString());
              },
            );
          },
        ),
      ),
    );
  }
}

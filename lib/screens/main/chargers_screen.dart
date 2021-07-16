import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/models/fake_data.dart';
import 'package:gl_charge_app/models/charger.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar1.dart';
import 'package:gl_charge_app/stateless_widget_components/charger_list_item.dart';
import 'package:gl_charge_app/utils/constants.dart';

class ChargersScreen extends StatefulWidget {
  @override
  _ChargersScreenState createState() => _ChargersScreenState();
}

class _ChargersScreenState extends State<ChargersScreen> {

  List<ChargerModel> list = listOfChargersFake;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar1(title: "Chargers"),
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

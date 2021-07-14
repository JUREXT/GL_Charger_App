import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/components/charger_list_item.dart';
import 'package:gl_charge_app/models/FakeData.dart';
import 'package:gl_charge_app/models/charger.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBar1.dart';

class ChargersScreen extends StatefulWidget {
  @override
  _ChargersScreenState createState() => _ChargersScreenState();
}

class _ChargersScreenState extends State<ChargersScreen> {

  List<ChargerModel> list = listOfChargersFake;

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

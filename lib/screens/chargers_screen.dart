import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBar1.dart';
import 'package:gl_charge_app/widgets/appChargerListItem.dart';

class ChargersScreen extends StatefulWidget {
  @override
  _ChargersScreenState createState() => _ChargersScreenState();
}

class _ChargersScreenState extends State<ChargersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1("Chargers"),
      backgroundColor: Constants.ColorLightGrey,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            appChargerListItem("Home Charger 1", true, true, "Ljubljana", "1978523"),
            SizedBox(height: 22.0),
            appChargerListItem("Home Charger 2", false, false, "Celje", "197881213"),
            SizedBox(height: 22.0),
            appChargerListItem("Home Charger 3", false, false, "Koper", "19785148989"),
            SizedBox(height: 22.0),
            appChargerListItem("Home Charger 4", true, true, "Maribor", "197847/2"),
            SizedBox(height: 22.0),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/network/models/all_user_chargers_response_model.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar1.dart';
import 'package:gl_charge_app/stateless_widget_components/charger_list_item.dart';
import 'package:gl_charge_app/utils/constants.dart';

class SelectChargerScreen extends StatefulWidget {
  @override
  _SelectChargerScreenState createState() => _SelectChargerScreenState();
}

class _SelectChargerScreenState extends State<SelectChargerScreen> {

  List<AllUserChargersResponseModel> list = [AllUserChargersResponseModel.fake("1", "Fake".toString())];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar1(title: "Chargers List"),
        backgroundColor: Constants.ColorLightGrey,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ChargerListItem(
                charger: list[index],
                reservedIconVisibility: false,
                onSelectedChargerCallback: (AllUserChargersResponseModel charger) {
                  print("onSelectedChargerCallback: " + charger.toString());
                 // navigate(context);
                },
              );
            },
          ),
        ));
  }
}

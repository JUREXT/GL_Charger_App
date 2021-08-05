import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/network/fake_data.dart';
import 'package:gl_charge_app/routes/app_pages.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar1.dart';
import 'package:gl_charge_app/stateless_widget_components/charger_list_item.dart';
import 'package:gl_charge_app/utils/Navigation.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'select_charger_controller.dart';

class SelectChargerScreen extends StatefulWidget {
  @override
  _SelectChargerScreenState createState() => _SelectChargerScreenState();
}

class _SelectChargerScreenState extends State<SelectChargerScreen> {

  final tag = "SelectChargerScreen";
  final controller = Get.find<SelectChargerController>();

  List<Charger> list = listOfChargersFake;

  @override
  void initState() {
    super.initState();
    controller.getAllChargersByUser(1);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar1(title: "Charger List"),
        backgroundColor: Constants.ColorLightGrey,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ChargerListItem(
                charger: list[index],
                onSelectedChargerCallback: (Charger charger) {
                  Log.d(tag,"onSelectedChargerCallback: " + charger.toString());
                  Navigation.toNamed(Routes.MAIN_TAB_HOLDER, charger);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

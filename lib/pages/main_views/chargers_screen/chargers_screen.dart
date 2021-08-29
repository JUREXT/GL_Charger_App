import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/pages/main_views/main_screen_holder/main_screen_holder_controller.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar1.dart';
import 'package:gl_charge_app/stateless_widget_components/charger_list_item.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/storage.dart';
import 'chargers_controller.dart';

class ChargersScreen extends StatefulWidget {
  @override
  _ChargersScreenState createState() => _ChargersScreenState();
}

class _ChargersScreenState extends State<ChargersScreen> {
  final tag = "ChargersScreen";

  ChargersController controller = Get.find();
  MainScreenHolderController controllerMain = Get.find();

  @override
  void initState() {
    super.initState();
    controller.getChargerList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar1(title: "title_chargers".tr),
        backgroundColor: Constants.ColorLightGrey,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.chargerList.length,
              itemBuilder: (context, index) {
                return ChargerListItem(
                  charger: controller.chargerList[index],
                  onSelectedChargerCallback: (Charger charger) async {
                    Log.d(tag, "onSelectedChargerCallback: " + charger.toString());
                    await Storage().write(Storage.CURRENT_CHARGER_DATA, Charger().chargerToJson(charger));
                    controllerMain.switchTabToNewIndex(1);
                  },
                );
              },
            );
          }),
        ),
      ),
    );
  }
}

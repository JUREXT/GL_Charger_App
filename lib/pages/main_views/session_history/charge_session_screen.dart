import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/charge_session.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar1.dart';
import 'package:gl_charge_app/stateless_widget_components/session_list_item.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'charger_session_controller.dart';

class ChargeSessionScreen extends StatefulWidget {
  @override
  _ChargeSessionScreenState createState() => _ChargeSessionScreenState();
}

class _ChargeSessionScreenState extends State<ChargeSessionScreen> {
  final tag = "ChargeSessionScreen";

  ChargeSessionController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.getFakeList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar1(title: "title_charger_session".tr),
        backgroundColor: Constants.ColorLightGrey,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.chargerList.length,
              itemBuilder: (context, index) {
                return SessionListItem(
                  session: controller.chargerList[index],
                  onSelectedItemCallback: (ChargeSessionDTO chargeSession) async {
                    Log.d(tag, "onSelectedItemCallback: " + chargeSession.toString());
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

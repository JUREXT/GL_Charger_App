import 'package:flutter/material.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/storage.dart';

class ChargeNotifier extends ChangeNotifier {
  final tag = "ChargeNotifier";

  ChargeNotifier() {
    setNewCharger();
  }

  String chargerName = "";

  Future<void> setNewCharger() async {
    Charger charger = await getData();
    Log.d(tag, "SetNewCharger: $charger");
    if(charger != null) {
      chargerName = charger.name;
      notifyListeners();
    }
  }

  Future<Charger> getData() async {
    var charger = await Storage().getSelectedChargerData();
    return charger;
  }
}
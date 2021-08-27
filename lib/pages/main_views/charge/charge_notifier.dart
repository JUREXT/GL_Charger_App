import 'package:flutter/material.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/storage.dart';

class ChargeNotifier extends ChangeNotifier {
  final tag = "ChargeNotifier";

  ChargeNotifier() {
    setNewCharger();
  }

  String chargerName = "2";

  Future<void> setNewCharger() async {
    Charger charger = await getData();
    Log.d(tag, "SetNewCharger: $charger");
    if(charger != null) {
      chargerName = charger.chargerName;
      notifyListeners();
    }
  }

  Future<Charger> getData() async {
    String chargerJson = await Storage().read(Storage.CURRENT_CHARGER_DATA);
    if (chargerJson != null) {
      Charger charger = Charger().chargerFromJson(chargerJson);
      Log.d(tag, "Current Charger :: $charger");
      // await DelayHelper.delay(2);
      return charger;
    } else {
      return null;
    }
  }
}
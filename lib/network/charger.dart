import 'package:flutter/cupertino.dart';

class Charger {
  String chargerName;
  bool isOnline;
  bool chargingState;
  String chargerLocation;
  String maxPower;

  Charger({
    @required this.chargerName,
    @required this.isOnline,
    @required this.chargingState,
    @required this.chargerLocation,
    @required this.maxPower,
  });

  @override
  String toString() {
    return 'ChargerModel{chargerName: $chargerName, isOnline: $isOnline, chargingState: $chargingState, chargerLocation: $chargerLocation, maxPower: $maxPower}';
  }
}

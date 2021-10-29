import 'dart:convert';

class Charger {
  String chargerName;
  bool isOnline;
  bool chargingState;
  String chargerLocation;
  String maxPower;

  Charger(
      {this.chargerName,
        this.isOnline,
        this.chargingState,
        this.chargerLocation,
        this.maxPower});

  Charger.fromJson(Map<String, dynamic> json) {
    chargerName = json['chargerName'];
    isOnline = json['isOnline'];
    chargingState = json['chargingState'];
    chargerLocation = json['chargerLocation'];
    maxPower = json['maxPower'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chargerName'] = this.chargerName;
    data['isOnline'] = this.isOnline;
    data['chargingState'] = this.chargingState;
    data['chargerLocation'] = this.chargerLocation;
    data['maxPower'] = this.maxPower;
    return data;
  }

  Charger chargerFromJson(String str) => Charger.fromJson(json.decode(str)); // used to store into local storage
  String chargerToJson(Charger data) => json.encode(data.toJson());

  @override
  String toString() {
    return 'Charger{chargerName: $chargerName, isOnline: $isOnline, chargingState: $chargingState, chargerLocation: $chargerLocation, maxPower: $maxPower}';
  }
}
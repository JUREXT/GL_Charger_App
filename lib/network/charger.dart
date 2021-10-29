import 'dart:convert';
class Charger {
  String id;
  String name;
  bool isOnline;
  bool chargingState;
  String chargerLocation;
  String maxPower;
  String ocppId;

  Charger(this.id, this.name, this.isOnline, this.chargingState,
      this.chargerLocation, this.maxPower, this.ocppId);

  Charger.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isOnline = json['isOnline'];
    chargingState = json['chargingState'];
    chargerLocation = json['chargerLocation'];
    maxPower = json['maxPower'];
    ocppId = json['ocppId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['isOnline'] = this.isOnline;
    data['chargingState'] = this.chargingState;
    data['chargerLocation'] = this.chargerLocation;
    data['maxPower'] = this.maxPower;
    data['ocppId'] = this.ocppId;
    return data;
  }

  static Charger chargerFromJson(String str) => Charger.fromJson(json.decode(str));
  static String chargerToJson(Charger data) => json.encode(data.toJson());

  @override
  String toString() {
    return 'Charger{id: $id, name: $name, isOnline: $isOnline, chargingState: $chargingState, chargerLocation: $chargerLocation, maxPower: $maxPower, ocppId: $ocppId}';
  }
}
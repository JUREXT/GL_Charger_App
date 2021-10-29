import 'dart:convert';

import 'package:gl_charge_app/utils/log.dart';

import '../charger.dart';

class AllUserChargersResponseModel {
  String id;
  Null energyMeterId;
  Null maxCurrent;
  Null voltage;
  String name; // was Null type before
  Null publicIpv4;
  Null publicIpv6;
  Null port;
  Null chargerConnection;
  Null authentication;
  Null chargingMethod;
  Null serial;
  Null manufacturer;
  Null model;
  String ocppId;
  Null chargePointId;
  Null minPower;
  String maxPower; // was Null type before
  Null numberOfConnectors;
  Null currentFirmwareVersion;
  Null chargePointVendor;
  Null chargerConfiguration;
  Null status;
  int acknowledged;
  int accepted;
  int deleted;
  String createdAt;
  String updatedAt;

  AllUserChargersResponseModel(
      {this.id,
        this.energyMeterId,
        this.maxCurrent,
        this.voltage,
        this.name,
        this.publicIpv4,
        this.publicIpv6,
        this.port,
        this.chargerConnection,
        this.authentication,
        this.chargingMethod,
        this.serial,
        this.manufacturer,
        this.model,
        this.ocppId,
        this.chargePointId,
        this.minPower,
        this.maxPower,
        this.numberOfConnectors,
        this.currentFirmwareVersion,
        this.chargePointVendor,
        this.chargerConfiguration,
        this.status,
        this.acknowledged,
        this.accepted,
        this.deleted,
        this.createdAt,
        this.updatedAt});

  AllUserChargersResponseModel.fake(this.id, this.name);

  AllUserChargersResponseModel.fromJson(Map<String, dynamic> json) { // == null ? null : json["key1"],
    id = json['id'];
    energyMeterId = json['energyMeterId'] == null ? null : json["energyMeterId"];
    maxCurrent = json['maxCurrent'] == null ? null : json["maxCurrent"];
    voltage = json['voltage'] == null ? null : json["voltage"];
    name = json['name'] == null ? null : json["name"];
   // publicIpv4 = json['publicIpv4'] == null ? null : json["publicIpv4"];
    publicIpv6 = json['publicIpv6'] == null ? null : json["publicIpv6"];
    port = json['port'] == null ? null : json["port"];
    chargerConnection = json['chargerConnection'] == null ? null : json["chargerConnection"];
    authentication = json['authentication'] == null ? null : json["authentication"];
    chargingMethod = json['chargingMethod'] == null ? null : json["chargingMethod"];
    //serial = json['serial'] == null ? null : json["serial"];
    //manufacturer = json['manufacturer'] == null ? null : json["manufacturer"];
    //model = json['model'] == null ? null : json["model"];
    ocppId = json['ocppId'] == null ? null : json["ocppId"];
    chargePointId = json['chargePointId'] == null ? null : json["chargePointId"];
    minPower = json['minPower'] == null ? null : json["minPower"];
    maxPower = json['maxPower'] == null ? null : json["maxPower"];
    //numberOfConnectors = json['numberOfConnectors'] == null ? null : json["numberOfConnectors"];
   // currentFirmwareVersion = json['currentFirmwareVersion'] == null ? null : json["currentFirmwareVersion"];
    //chargePointVendor = json['chargePointVendor'] == null ? null : json["chargePointVendor"];
   // chargerConfiguration = json['chargerConfiguration'] == null ? null : json["chargerConfiguration"];
    //status = json['status'] == null ? null : json["status"];
    acknowledged = json['acknowledged'] == null ? null : json["acknowledged"];
    accepted = json['accepted'] == null ? null : json["accepted"];
    deleted = json['deleted'] == null ? null : json["deleted"];
    createdAt = json['createdAt'] == null ? null : json["createdAt"];
    updatedAt = json['updatedAt'] == null ? null : json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['energyMeterId'] = this.energyMeterId;
    data['maxCurrent'] = this.maxCurrent;
    data['voltage'] = this.voltage;
    data['name'] = this.name;
    data['publicIpv4'] = this.publicIpv4;
    data['publicIpv6'] = this.publicIpv6;
    data['port'] = this.port;
    data['chargerConnection'] = this.chargerConnection;
    data['authentication'] = this.authentication;
    data['chargingMethod'] = this.chargingMethod;
    data['serial'] = this.serial;
    data['manufacturer'] = this.manufacturer;
    data['model'] = this.model;
    data['ocppId'] = this.ocppId;
    data['chargePointId'] = this.chargePointId;
    data['minPower'] = this.minPower;
    data['maxPower'] = this.maxPower;
    data['numberOfConnectors'] = this.numberOfConnectors;
    data['currentFirmwareVersion'] = this.currentFirmwareVersion;
    data['chargePointVendor'] = this.chargePointVendor;
    data['chargerConfiguration'] = this.chargerConfiguration;
    data['status'] = this.status;
    data['acknowledged'] = this.acknowledged;
    data['accepted'] = this.accepted;
    data['deleted'] = this.deleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }

  static List<AllUserChargersResponseModel> parseList(List jsonResponseList) {
    return jsonResponseList.map((it) => AllUserChargersResponseModel.fromJson(it)).toList();
  }

  static List<Charger> modifyListAndConvert(List<AllUserChargersResponseModel> list) { // updated null names and other problems
    List<Charger> updatedList = [];
    int chargerIndex = 1;
    for (var it in list) {
      //Log.d("ModifyListAndConvert", "Charger ID:" + it.id + " Name: " + it.name + " ocppId: " + it.ocppId);
      if(it.name == null) {
        String id = it.id.toString();
        String name = "Charger $chargerIndex";
        bool isOnline = false;
        bool chargingState = false;
        String chargerLocation = "Location $chargerIndex";
        String maxPower = it.maxPower == null ? "Not available" : it.maxPower.toString();
        String ocppId = it.ocppId.toString();
        chargerIndex++;
        var char = Charger(id, name, isOnline, chargingState, chargerLocation, maxPower, ocppId);
       // var char = Charger("1", "name", false, false, "chargerLocation", "maxPower", "ocppId");
        updatedList.add(char);
      }
    }
    return updatedList;
  }

  // Used to store into local storage.
  AllUserChargersResponseModel chargerFromJson(String str) => AllUserChargersResponseModel.fromJson(json.decode(str));
  String chargerToJson(AllUserChargersResponseModel data) => json.encode(data.toJson());

  @override
  String toString() {
    return 'AllUserChargersResponseModel{id: $id, name: $name, ocppId: $ocppId}';
  }
}
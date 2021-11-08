class VerifyIfChargingDataModel {
  String ocppId;

  VerifyIfChargingDataModel({this.ocppId});

  VerifyIfChargingDataModel.fromJson(Map<String, dynamic> json) {
    ocppId = json['ocppId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ocppId'] = this.ocppId;
    return data;
  }
}
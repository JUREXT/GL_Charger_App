class StartChargingResponseModel {
  String chargerId;

  StartChargingResponseModel({this.chargerId});

  StartChargingResponseModel.fromJson(Map<String, dynamic> json) {
    chargerId = json['charger_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['charger_id'] = this.chargerId;
    return data;
  }
}
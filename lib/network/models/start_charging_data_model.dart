class StartChargingDataModel {
  String id;
  String profileId;

  StartChargingDataModel({this.id, this.profileId});

  StartChargingDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profileId = json['profileId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['profileId'] = this.profileId;
    return data;
  }
}
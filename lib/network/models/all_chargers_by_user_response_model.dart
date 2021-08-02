class AllChargersByUserResponseModel {
  List<String> chargers;

  AllChargersByUserResponseModel({this.chargers});

  AllChargersByUserResponseModel.fromJson(Map<String, dynamic> json) {
    chargers = json['chargers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chargers'] = this.chargers;
    return data;
  }
}
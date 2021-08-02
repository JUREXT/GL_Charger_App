class AllChargersByUserDataModel {
  int userid;

  AllChargersByUserDataModel({this.userid});

  AllChargersByUserDataModel.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    return data;
  }
}
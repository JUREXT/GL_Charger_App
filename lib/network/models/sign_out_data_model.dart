class SignOutDataModel {
  String refreshToken;

  SignOutDataModel({this.refreshToken});

  SignOutDataModel.fromJson(Map<String, dynamic> json) {
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
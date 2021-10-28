class BillingResponseModel {
  String token;

  BillingResponseModel({this.token});

  BillingResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }

  @override
  String toString() {
    return 'BillingResponseModel{token: $token}';
  }
}
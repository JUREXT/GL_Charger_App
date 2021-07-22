class SignInResponse {
  bool success;
  Null errors;
  Data data;

  SignInResponse({this.success, this.errors, this.data});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errors = json['errors'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String accessToken;
  String refreshToken;
  String email;
  String userId;

  Data({this.accessToken, this.refreshToken, this.email, this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    email = json['email'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['email'] = this.email;
    data['userId'] = this.userId;
    return data;
  }
}
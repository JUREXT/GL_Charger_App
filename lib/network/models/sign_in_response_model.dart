import 'dart:convert';

class SignInResponseModel {
  String accessToken;
  String refreshToken;
  String email;
  String id;
  int accessTokenExpiration;

  SignInResponseModel(
      {this.accessToken,
        this.refreshToken,
        this.email,
        this.id,
        this.accessTokenExpiration});

  SignInResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    email = json['email'];
    id = json['id'];
    accessTokenExpiration = json['accessTokenExpiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['email'] = this.email;
    data['id'] = this.id;
    data['accessTokenExpiration'] = this.accessTokenExpiration;
    return data;
  }

  SignInResponseModel modelFromJson(String str) => SignInResponseModel.fromJson(json.decode(str));
  String modelToJson(SignInResponseModel data) => json.encode(data.toJson());

  @override
  String toString() {
    return 'SignInResponseModel{accessToken: $accessToken, refreshToken: $refreshToken, email: $email, id: $id, accessTokenExpiration: $accessTokenExpiration}';
  }
}
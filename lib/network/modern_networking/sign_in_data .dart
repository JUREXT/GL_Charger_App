import 'package:flutter/cupertino.dart';

class SignInData {
  String email;
  String password;

  SignInData({@required this.email, @required this.password});

  SignInData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
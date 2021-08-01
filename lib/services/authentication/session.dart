import 'package:flutter/cupertino.dart';

class Session {
  String accessToken;
  String refreshToken;
  String email;
  String id;

  Session({this.accessToken, this.refreshToken, this.email, this.id});

  bool isNull() {
    return accessToken == null && refreshToken == null && email == null && id == null;
  }

  @override
  String toString() {
    return 'Session{accessToken: $accessToken, refreshToken: $refreshToken, email: $email, id: $id}';
  }
}
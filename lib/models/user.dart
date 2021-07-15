
import 'package:flutter/cupertino.dart';

class UserModel {
  String nameSurname;
  String id;

  // String email;
  // String photoUrl;
  // String country;
  // String bio;
  // DateTime signedUpAt;
  // DateTime lastSeen;
  // bool isOnline;

  UserModel({
    @required this.nameSurname,
    @required this.id,
  });

  @override
  String toString() {
    return 'UserModel{nameSurname: $nameSurname, id: $id}';
  }

// UserModel.fromJson(Map<String, dynamic> json) {
  //   username = json['username'];
  //   email = json['email'];
  //   country = json['country'];
  //   photoUrl = json['photoUrl'];
  //   signedUpAt = json['signedUpAt'];
  //   isOnline = json['isOnline'];
  //   lastSeen = json['lastSeen'];
  //   bio = json['bio'];
  //   id = json['id'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['username'] = this.username;
  //   data['country'] = this.country;
  //   data['email'] = this.email;
  //   data['photoUrl'] = this.photoUrl;
  //   data['bio'] = this.bio;
  //   data['signedUpAt'] = this.signedUpAt;
  //   data['isOnline'] = this.isOnline;
  //   data['lastSeen'] = this.lastSeen;
  //   data['id'] = this.id;
  //   return data;
  // }
}

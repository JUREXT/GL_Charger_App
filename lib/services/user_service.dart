import 'dart:io';
import 'services.dart';

class UserService extends Service {
  String currentUid() {
    return "1";
  }

  setUserStatusOnline(bool isOnline) {}

  Future<bool> updateProfile(
      {File image, String username, String bio, String country}) async {
    return true;
  }
}

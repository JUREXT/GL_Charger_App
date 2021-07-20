import 'package:flutter/foundation.dart';
import 'package:gl_charge_app/models/user2.dart';

class UserProvider with ChangeNotifier {
  User2 _user = new User2();

  User2 get user => _user;

  void setUser(User2 user) {
    _user = user;
    notifyListeners();
  }
}

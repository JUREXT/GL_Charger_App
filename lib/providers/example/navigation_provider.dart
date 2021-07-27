import 'package:flutter/foundation.dart';

enum NavigationTyp { SignIn, CreateAccount, ForgotPassword, SelectCharger, Undefined }

class NavigationNotifier with ChangeNotifier {

  NavigationTyp _navigation = NavigationTyp.Undefined;
  NavigationTyp get navigation => _navigation;

  goToSignIn() {
    _navigation = NavigationTyp.SignIn;
    notifyListeners();
  }

  goToCreateAccount() {
    _navigation = NavigationTyp.CreateAccount;
    notifyListeners();
  }

  goToForgotPassword() {
    _navigation = NavigationTyp.ForgotPassword;
    notifyListeners();
  }

  goToSelectCharger() {
    _navigation = NavigationTyp.SelectCharger;
    notifyListeners();
  }
}

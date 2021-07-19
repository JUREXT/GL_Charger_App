import 'package:flutter/material.dart';

enum Navigation { SignIn, CreateAccount, ForgotPassword, SelectCharger, Undefined }

class NavigationNotifier with ChangeNotifier {
  Navigation _navigation = Navigation.Undefined;

  Navigation get navigation => _navigation;

  goToSignIn() {
    _navigation = Navigation.SignIn;
    notifyListeners();
  }

  goToCreateAccount() {
    _navigation = Navigation.CreateAccount;
    notifyListeners();
  }

  goToForgotPassword() {
    _navigation = Navigation.ForgotPassword;
    notifyListeners();
  }

  goToSelectCharger() {
    _navigation = Navigation.SelectCharger;
    notifyListeners();
  }
}

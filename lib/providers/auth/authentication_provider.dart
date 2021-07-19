import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gl_charge_app/models/user2.dart';
import 'package:gl_charge_app/utils/app_url.dart';
import 'package:gl_charge_app/utils/shared_preference.dart';
import 'package:http/http.dart';

enum AuthenticationStatus {
  NotLoggedIn,
  LoggingIn,
  Authenticating,
  Authenticated,
  LoggedIn,
  Unauthenticated,
  Undefined
}


class AuthenticationNotifier with ChangeNotifier {

  AuthenticationStatus _authenticationStatus = AuthenticationStatus.Undefined;
  AuthenticationStatus get authenticationStatus => _authenticationStatus;

  logOut() {
    _authenticationStatus = AuthenticationStatus.NotLoggedIn;
    notifyListeners();
  }

  // register(String email) {
  //   _authenticationStatus = AuthenticationStatus.Register;
  //   notifyListeners();
  // }
  //
  // forgotPassword(String email) {
  //   _authenticationStatus = AuthenticationStatus.ForgotPassword;
  //   notifyListeners();
  // }

  bool getCurrentLoggedInUser() {
    return true;
  }

  // Future<Map<String, dynamic>> logIn(String email, String password) async {
  //   var result;
  //
  //   final Map<String, dynamic> loginData = {
  //     'user': {
  //       'email': email,
  //       'password': password
  //     }
  //   };
  //
  //
  //   _loggedInStatus = Status.Authenticating;
  //   notifyListeners();
  //
  //   // Response response = await post(
  //   //   AppUrl.login,
  //   //   body: json.encode(loginData),
  //   //   headers: {'Content-Type': 'application/json'},
  //   // );
  //
  //  // await Future.delayed(Duration(seconds: 3));
  //
  //  // if (response.statusCode == 200) {
  //   if (true) {
  //    // final Map<String, dynamic> responseData = json.decode(response.body);
  //
  //   //  var userData = responseData['data'];
  //
  //     User authUser = User.test(1, "Jure", "loki@email.com", "128998", "Type", "125458", "51"); //User.fromJson(userData);
  //
  //     UserPreferences().saveUser(authUser);
  //
  //     _loggedInStatus = Status.LoggedIn;
  //     notifyListeners();
  //
  //     result = {'status': true, 'message': 'Successful', 'user': authUser};
  //   } else {
  //     // _loggedInStatus = Status.NotLoggedIn;
  //     // notifyListeners();
  //     // result = {
  //     //   'status': false,
  //     //   'message': json.decode(response.body)['error']
  //     // };
  //   }
  //  return result;
  // //  User authUser = User.test(1, "Jure", "loki@email.com", "128998", "Type", "125458", "51");
  //  // return result = {'status': true, 'message': 'Successful', 'user': authUser};
  // }

  Future<Map<String, dynamic>> register1(String email, String password, String passwordConfirmation) async {

    final Map<String, dynamic> registrationData = {
      'user': {
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation
      }
    };
    return await post(AppUrl.register,
        body: json.encode(registrationData),
        headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  static Future<FutureOr> onValue(Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    print(response.statusCode);
    if (response.statusCode == 200) {

      var userData = responseData['data'];

      User authUser = null; //User.fromJson(userData);

      UserPreferences().saveUser(authUser);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
//      if (response.statusCode == 401) Get.toNamed("/login");
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }

    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }

  String handleFirebaseAuthError(String e) {
    if (e.contains("ERROR_WEAK_PASSWORD")) {
      return "Password is too weak";
    } else if (e.contains("invalid-email")) {
      return "Invalid Email";
    } else if (e.contains("ERROR_EMAIL_ALREADY_IN_USE") ||
        e.contains('email-already-in-use')) {
      return "The email address is already in use by another account.";
    } else if (e.contains("ERROR_NETWORK_REQUEST_FAILED")) {
      return "Network error occured!";
    } else if (e.contains("ERROR_USER_NOT_FOUND") ||
        e.contains('firebase_auth/user-not-found')) {
      return "Invalid credentials.";
    } else if (e.contains("ERROR_WRONG_PASSWORD") ||
        e.contains('wrong-password')) {
      return "Invalid credentials.";
    } else if (e.contains('firebase_auth/requires-recent-login')) {
      return 'This operation is sensitive and requires recent authentication.'
          ' Log in again before retrying this request.';
    } else {
      return e;
    }
  }

}
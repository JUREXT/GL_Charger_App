import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:gl_charge_app/models/user2.dart';
import 'package:gl_charge_app/utils/app_url.dart';
import 'package:gl_charge_app/utils/shared_preference.dart';
import 'package:http/http.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthenticationProvider with ChangeNotifier {

  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;

  logOut() {
    _loggedInStatus = Status.NotLoggedIn;
    notifyListeners();
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'user': {
        'email': email,
        'password': password
      }
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Future.delayed(const Duration(seconds: 5), () {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
    });



    // Response response = await post(
    //   AppUrl.login,
    //   body: json.encode(loginData),
    //   headers: {'Content-Type': 'application/json'},
    // );

   // await Future.delayed(Duration(seconds: 3));

   // if (response.statusCode == 200) {
    if (true) {
     // final Map<String, dynamic> responseData = json.decode(response.body);

    //  var userData = responseData['data'];

      User2 authUser = User2.test(1, "Jure", "loki@email.com", "128998", "Type", "125458", "51"); //User.fromJson(userData);

      UserPreferences().saveUser(authUser);

      // _loggedInStatus = Status.LoggedIn;
      // notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      // _loggedInStatus = Status.NotLoggedIn;
      // notifyListeners();
      // result = {
      //   'status': false,
      //   'message': json.decode(response.body)['error']
      // };
    }
   return result;
  //  User authUser = User.test(1, "Jure", "loki@email.com", "128998", "Type", "125458", "51");
   // return result = {'status': true, 'message': 'Successful', 'user': authUser};
  }

  Future<Map<String, dynamic>> register(String email, String password, String passwordConfirmation) async {

    final Map<String, dynamic> registrationData = {
      'user': {
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation
      }
    };
    return await post(Uri(path: AppUrl.register),
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

      User2 authUser = null; //User.fromJson(userData);

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

}
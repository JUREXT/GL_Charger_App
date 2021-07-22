import 'package:flutter/cupertino.dart';
import 'package:gl_charge_app/utils/constants.dart';

import 'TestUser.dart';
import 'api_base_helper.dart';
import 'sign_in_data  .dart';
import 'sign_in_reponse .dart';

class Repository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<TestUser> fetchUser() async {
    final response = await _helper.get(Constants.logInEndPoint);
    return TestUser.fromJson(response);
  }

  Future<SignInResponse> signIn(String email, String password) async {
    var body = SignInData(email: email, password: password).toJson();
    final response = await _helper.post(Constants.logInEndPoint, body);
    return SignInResponse.fromJson(response);
  }
}

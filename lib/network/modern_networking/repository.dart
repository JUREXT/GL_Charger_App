import 'package:gl_charge_app/network/modern_networking/register_data%20.dart';
import 'package:gl_charge_app/network/modern_networking/register_response.dart';
import 'package:gl_charge_app/network/modern_networking/sign_in_response.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'TestUser.dart';
import 'api_base_helper.dart';
import 'sign_in_data .dart';

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

  Future<RegisterResponse> register(String username, String firstname, String lastname, String email, String password) async {
    var body = RegisterData(username: username, firstname: firstname, lastname: lastname, email: email, password: password).toJson();
    print(body);
    final response = await _helper.post(Constants.registerEndPoint, body);
    return RegisterResponse.fromJson(response);
  }
}

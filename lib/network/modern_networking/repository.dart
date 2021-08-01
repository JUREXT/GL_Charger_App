import 'package:gl_charge_app/network/modern_networking/register_response.dart';
import 'package:gl_charge_app/network/modern_networking/sign_in_response.dart';
import 'package:gl_charge_app/network/modern_networking/testing/main_response.dart';
import 'package:gl_charge_app/network/modern_networking/testing/user_log_in.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'api_base_helper.dart';
import 'register_data.dart';
import 'sign_in_data .dart';

class Repository {
  ApiBaseHelper api = ApiBaseHelper();

  Future<String> signIn(String email, String password) async {
    var res = await api.get("https://jsonplaceholder.typicode.com/users/1");




    return "OK";
  }

  Future<UserLogIn> fetchTest() async {
    // var res = await _helper.testGet();
    //  if(res is MySuccessState) {
    //    Log.d("fetchTest", "MySuccessState: " + res.data.toString());
    //    return UserLogIn.success("success");
    //  } else if(res is MyErrorState) {
    //    Log.d("fetchTest", "MyErrorState: " + res.data.toString());
    //    return UserLogIn.error("error");
    //  } else {
    //    return UserLogIn.error("error");
    //  }
    return UserLogIn.error("error");
  }

  // Future<SignInResponse> signIn(String email, String password) async {
  //   var body = SignInData(email: email, password: password).toJson();
  //   final response = await _helper.post(Constants.logInEndPoint, body);
  //   return SignInResponse.fromJson(response);
  // }
  //
  // Future<RegisterResponse> register(String username, String firstname, String lastname, String email, String password) async {
  //   var body = RegisterData(username: username, firstname: firstname, lastname: lastname, email: email, password: password).toJson();
  //   print(body);
  //   final response = await _helper.post(Constants.registerEndPoint, body);
  //   return RegisterResponse.fromJson(response);
  // }
}

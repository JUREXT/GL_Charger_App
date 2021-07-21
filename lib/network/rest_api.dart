import 'package:gl_charge_app/network/user.dart';
import 'package:http/http.dart';
import 'api_response.dart';

class RestAPI {

  Future logIn(String email, String password) async {
    Response response = await get("https://jsonplaceholder.typicode.com/users/1");
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  // Future<ApiResponse<User>> fetchUser() async {
  //   Response response = await get("https://jsonplaceholder.typicode.com/users/1");
  //   //return MovieResponse.fromJson(response).results;
  //   if (response.statusCode == 200) {
  //     return ApiResponse.
  //   } else {
  //     print(response.statusCode);
  //   }
  // }


}
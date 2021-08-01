import 'dart:convert';
import 'package:gl_charge_app/utils/log.dart';
import 'package:http/http.dart' as http;

import 'ErrorResp.dart';
import 'LoginResp.dart';

class TestAPI {
  static var client = http.Client();
  static var _baseURL = "https://jsonplaceholder.typicode.com";

  static Future<List> refreshToken({String token}) async {
    var response =
        await client.post(Uri(path: '$_baseURL/auth/refresh'), headers: <String, String>{
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var json = response.body;
      //status is success but not excepted result
      if (json.contains("access_token") == false) {
        return ["", "Unknown Error"];
      }
      var loginRes = loginRespFromJson(json);
      if (loginRes != null) {
        return [loginRes.accessToken, ""];
      } else {
        return ["", "Unknown Error"];
      }
    } else {
      var json = response.body;
      var errorResp = errorRespFromJson(json);
      if (errorResp == null) {
        return ["", "Unknown Error"];
      } else {
        return ["", errorResp.error];
      }
    }
  }

  static Future<List> test() async {
    var response = await client.get('https://jsonplaceholder.typicode.com/posts/1',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
       // body: jsonEncode(<String, String>{"email": email, "password": password})
    );
    Log.d("test", "Data: " + response.body);
    return ["", "Unknown Error"];
    //
    // if (response.statusCode == 200) {
    //   var json = response.body;
    //   var loginRes = loginRespFromJson(json);
    //   if (loginRes != null) {
    //     return [loginRes.accessToken, ""];
    //   } else {
    //     return ["", "Unknown Error"];
    //   }
    // } else {
    //   var json = response.body;
    //   var errorResp = errorRespFromJson(json);
    //   if (errorResp == null) {
    //     return ["", "Unknown Error"];
    //   } else {
    //     return ["", errorResp.error];
    //   }
    // }

  }
}

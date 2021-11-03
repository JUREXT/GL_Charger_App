import 'dart:convert';

// TODO: update later to be corect
// is Content-Type is set to: application/json, turn model into json and then use jsonEncode(json) for the body
class Headers {
  static authHeader(String accessToken) {
    return <String, String>{
     // 'Content-Type': 'application/json; charset=UTF-8',
      //'Authorization': 'Bearer ' + accessToken,
      'Authorization': 'Bearer $accessToken',
    };
  }

  static headers() {
    return <String, String>{
      //'Content-Type': 'application/json; charset=UTF-8',
    };
  }

  static headersSHA256(String sha256Value, String accessToken) {
    return <String, String>{
      'Authorization': 'Bearer $accessToken',
      'X-Request-Signature-SHA-256': sha256Value.toString(),
      //'Content-Type': 'application/json'
    };
  }

  static headersSHA256_2(String sha256Value, String accessToken) {
    Map<String, String> requestHeaders = {
      //'Content-type': 'application/json',
      //'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
      'X-Request-Signature-SHA-256': '$sha256Value'
    };
    //return requestHeaders;
    return jsonEncode(requestHeaders).toString();
  }
}




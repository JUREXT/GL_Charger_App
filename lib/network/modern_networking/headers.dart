class Headers {
  static authHeader(String accessToken) {
    return <String, String>{
     // 'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ' + accessToken,
    };
  }

  static headers() {
    return <String, String>{
      //'Content-Type': 'application/json; charset=UTF-8',
    };
  }
}

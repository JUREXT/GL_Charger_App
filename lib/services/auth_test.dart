import 'dart:math';

class AuthTest {
  static Future<bool> getBoolValue() async {
    // var random = Random(2);
    await Future.delayed(Duration(seconds: 2));
    return false;
  }

  static Future<bool> isValid() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

  static Future<bool> isInvalid() async {
    await Future.delayed(Duration(seconds: 2));
    return false;
  }
}

import 'dart:convert';
import 'package:crypto/crypto.dart';

class SHA256 {
  static String getSHA256Signature(String jsonAsString) {
    String key1 = "sk_5cz02n4knssbh395cz02n4knpzbh3f";
    // https://pub.dev/packages/crypto
    var key = utf8.encode(key1); // password
    var bytes = utf8.encode(jsonAsString);
    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
   // print("HMAC digest as bytes: ${digest.bytes}");
    //print("HMAC digest as hex string: $digest");
    return digest.toString();
  }
}

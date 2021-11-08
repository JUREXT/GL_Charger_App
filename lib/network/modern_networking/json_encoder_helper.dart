import 'dart:convert';

class JsonEncoderHelper {
  static convertJson(var json) {
    final jsonEncoder = JsonEncoder();
    return jsonEncoder.convert(json);
  }
}

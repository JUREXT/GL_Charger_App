import 'package:fimber/fimber.dart';

class Log {
  static bool _enableLogging = false;

  static enableLogger(bool enable) {
    _enableLogging = enable;
  }

  static d(String tag, String message) {
    if (_enableLogging) {
      var logger = FimberLog(tag);
      logger.d(message);
    }
  }

  static i(String tag, String message) {
    if (_enableLogging) {
      var logger = FimberLog(tag);
      logger.i(message);
    }
  }

  static w(String tag, String message) {
    if (_enableLogging) {
      var logger = FimberLog(tag);
      logger.w(message);
    }
  }
}

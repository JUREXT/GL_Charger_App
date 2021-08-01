import 'log.dart';

class DelayHelper {
  static delay(int seconds) async {
    Log.d("DelayHelper.delay", "Delay time in seconds: $seconds");
    await Future.delayed(Duration(seconds: seconds));
  }
}

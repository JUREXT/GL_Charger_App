class DelayHelper {
  static delay(int seconds) async {
    await Future.delayed(Duration(seconds: seconds));
  }
}

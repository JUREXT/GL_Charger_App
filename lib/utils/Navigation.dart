import 'package:get/get.dart';

// https://medium.com/@iamrutudhvaj/getx-flutter-b3781be2b644
class Navigation {
  static void to(var destination, var args) {
    Get.to(destination, arguments: args);
  }

  static void off(var destination) {
    Get.off(destination);
  }

  static void offAll(var destination) {
    Get.offAll(destination);
  }

  static void back(var args) {
    Get.back(result: args);
  }

  static void toNamed(String destination, var args) {
    Get.toNamed(destination.toString(), arguments: args);
  }
}

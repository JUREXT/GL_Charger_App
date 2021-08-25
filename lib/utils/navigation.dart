import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// https://medium.com/@iamrutudhvaj/getx-flutter-b3781be2b644
class Navigation {
  static void to(Widget destination) {
    Get.to(() => destination);
  }

  static void off(Widget destination) {
    Get.off(() => destination);
  }

  static void offAll(Widget destination) {
    Get.offAll(() => destination);
  }

  static void back(var args) {
    Get.back(result: args);
  }

  static void toNamed(String destination, var args) {
    Get.toNamed(destination.toString(), arguments: args);
  }
}

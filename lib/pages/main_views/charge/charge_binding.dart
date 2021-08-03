import 'package:get/get.dart';

import 'charge_controller.dart';

class ChargeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChargeController>(() => ChargeController());
  }
}

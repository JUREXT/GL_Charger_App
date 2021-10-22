import 'package:get/get.dart';

import 'charger_session_controller.dart';

class ChargeSessionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChargeSessionController>(() => ChargeSessionController());
  }
}

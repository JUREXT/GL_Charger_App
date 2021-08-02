import 'package:get/get.dart';
import 'select_charger_controller.dart';

class SelectChargerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectChargerController>(() => SelectChargerController());
  }
}

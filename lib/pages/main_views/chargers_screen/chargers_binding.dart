import 'package:get/get.dart';
import 'chargers_controller.dart';

class ChargersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChargersController>(() => ChargersController());
  }
}

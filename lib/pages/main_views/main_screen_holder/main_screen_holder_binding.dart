import 'package:get/get.dart';
import 'package:gl_charge_app/pages/main_views/chargers_screen/chargers_controller.dart';

import 'main_screen_holder_controller.dart';

class MainScreenHolderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainScreenHolderController>(() => MainScreenHolderController());
    Get.lazyPut<ChargersController>(() => ChargersController());
  }
}

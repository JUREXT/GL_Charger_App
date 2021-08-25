import 'package:get/get.dart';
import 'package:gl_charge_app/pages/main_views/charge/charge_controller.dart';
import 'package:gl_charge_app/pages/main_views/main_screen_holder/main_screen_holder_controller.dart';
import 'sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<MainScreenHolderController>(() => MainScreenHolderController());
    Get.lazyPut<ChargeController>(() => ChargeController());
  }
}

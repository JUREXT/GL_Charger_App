import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/utils/log.dart';

class ChargeController extends GetxController {
  final tag = "ChargeController";
  Repository repository;
  Rx<Resource> apiChargersResponse = Rx<Resource>(Resource.idle());

  // startCharging() async {
  //   repository.startCharging("", "");
  // }

  @override
  void onInit() {
    super.onInit();
    repository = Repository();
    Log.d(tag, "onInit");
  }

  @override
  void onReady() {
    super.onReady();
    Log.d(tag, "onReady");
  }

  @override
  void onClose() {
    Log.d(tag, "onClose");
    apiChargersResponse(Resource.idle());
  }
}

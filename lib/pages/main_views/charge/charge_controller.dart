import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/utils/log.dart';

class ChargeController extends GetxController {
  final tag = "ChargeController";
  Repository repository;
  Rx<ApiResponse> apiChargersResponse = Rx<ApiResponse>(ApiResponse.idle());

  startCharging() async {
    repository.startCharging("", "");
  }

  @override
  void onInit() {
    super.onInit();
    repository = Repository();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    apiChargersResponse(ApiResponse.idle());
  }
}

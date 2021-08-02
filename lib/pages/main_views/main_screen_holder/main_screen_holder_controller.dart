import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';

class MainScreenHolderController extends GetxController {
  final tag = "SignUpController";
  Repository repository;
  Rx<ApiResponse> apiRegisterResponse = Rx<ApiResponse>(ApiResponse.idle());

  // call methods

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
    apiRegisterResponse(ApiResponse.idle());
  }
}

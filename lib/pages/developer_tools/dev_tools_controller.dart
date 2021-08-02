import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';

class DevToolsController extends GetxController {
  final tag = "DevToolsController";
  Repository repository;
  Rx<ApiResponse> apiRegisterResponse = Rx<ApiResponse>(ApiResponse.idle());

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

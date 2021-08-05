import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';

class SelectChargerController extends GetxController {
  final tag = "SelectChargerController";
  Repository repository;
  Rx<ApiResponse> apiChargersResponse = Rx<ApiResponse>(ApiResponse.idle());

  getAllChargersByUser(int userId) async {
    repository.getAllChargersByUser(userId);
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

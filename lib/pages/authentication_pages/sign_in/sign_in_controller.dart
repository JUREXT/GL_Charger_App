import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/utils/log.dart';

class SignInController extends GetxController {
  final tag = "SignInController";
  Repository repository;
  Rx<ApiResponse> apiResponse = Rx<ApiResponse>(ApiResponse.idle());

  fetchTest(String email, String password) async {
    Log.d("TEST", "Idle");
    await Future.delayed(Duration(seconds: 1), () {
      Log.d("TEST", "Loading");
      apiResponse(ApiResponse.loading("loading msg"));
    });

    await Future.delayed(Duration(seconds: 2), () {
      Log.d("TEST", "Success");
      apiResponse(ApiResponse.success("success msg"));
    });

    await Future.delayed(Duration(seconds: 3), () {
      Log.d("TEST", "Error");
      apiResponse(ApiResponse.error("No Data","error msg"));
    });

    await Future.delayed(Duration(seconds: 4), () {
      Log.d("TEST", "Success Again");
      apiResponse(ApiResponse.success("success msg"));
    });
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
  void onClose() {}
}

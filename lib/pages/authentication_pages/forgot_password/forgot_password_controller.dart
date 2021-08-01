import 'package:get/get.dart';
import 'package:gl_charge_app/network/models/forgot_password_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/network/modern_networking/testing/api_result.dart';
import 'package:gl_charge_app/utils/delay_helper.dart';

class ForgotPasswordController extends GetxController {
  final tag = "ForgotPasswordController";
  Repository repository;
  Rx<ApiResponse> apiForgotPasswordResponse = Rx<ApiResponse>(ApiResponse.idle());

  forgotPassword(String email) async {
    apiForgotPasswordResponse(ApiResponse.loading(""));
    await DelayHelper.delay(1);
    var res = await repository.forgotPassword("", "");
    if(res is SuccessState) {
      var data = res.data as ForgotPasswordResponseModel;
      apiForgotPasswordResponse(ApiResponse.success(data));
      await DelayHelper.delay(1);
      apiForgotPasswordResponse(ApiResponse.idle());
    } else if(res is ErrorState) {
      var error = res.error as String;
      apiForgotPasswordResponse(ApiResponse.error(false, error));
      await DelayHelper.delay(1);
      apiForgotPasswordResponse(ApiResponse.idle());
    }
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
    apiForgotPasswordResponse(ApiResponse.idle());
  }
}

import 'package:get/get.dart';
import 'package:gl_charge_app/network/models/forgot_password_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/utils/delay_helper.dart';

class ForgotPasswordController extends GetxController {
  final tag = "ForgotPasswordController";
  Repository repository;
  var inputFormEnabled = true.obs;
  // var error = "";

  Rx<Resource> apiForgotPasswordResponse = Rx<Resource>(Resource.idle());

  forgotPassword(String email) async {
    inputFormEnabled(false);
    apiForgotPasswordResponse(Resource.loading(""));
    await DelayHelper.delay(1);
    var res = await repository.forgotPassword("", "");
    if(res is SuccessState) {
      var data = res.data as ForgotPasswordResponseModel;
      apiForgotPasswordResponse(Resource.success(data));
      await DelayHelper.delay(1);
      apiForgotPasswordResponse(Resource.idle());
    } else if(res is ErrorState) {
      inputFormEnabled(true);
      var error = res.error as String;
      apiForgotPasswordResponse(Resource.error(false, error));
      await DelayHelper.delay(1);
      apiForgotPasswordResponse(Resource.idle());
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
    apiForgotPasswordResponse(Resource.idle());
  }
}

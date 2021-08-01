import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/network/modern_networking/testing/test_obj.dart';
import 'package:gl_charge_app/network/modern_networking/testing/api_result.dart';
import 'package:gl_charge_app/utils/delay_helper.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/storage.dart';

class SignInController extends GetxController {
  final tag = "SignInController";
  Repository repository;
  Rx<ApiResponse> apiSignInResponse = Rx<ApiResponse>(ApiResponse.idle());

  signIn(String email, String password) async {
    apiSignInResponse(ApiResponse.loading(""));
    await DelayHelper.delay(1);
    var res = await repository.signIn(email, password);
    if(res is SuccessState) {
      var data = res.data as TestObj;

      Storage().write(Storage.SESSION_DATA, data.toJson().toString()); // TODO: update flow
      await DelayHelper.delay(2);
      Log.d(tag, "Session data ${Storage().read(Storage.SESSION_DATA)}");

      apiSignInResponse(ApiResponse.success(data));
      await DelayHelper.delay(1);
      apiSignInResponse(ApiResponse.idle());
    } else if(res is ErrorState) {
      var error = res.error as String;
      apiSignInResponse(ApiResponse.error(false, error));
      await DelayHelper.delay(1);
      apiSignInResponse(ApiResponse.idle());
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
    apiSignInResponse(ApiResponse.idle());
  }
}

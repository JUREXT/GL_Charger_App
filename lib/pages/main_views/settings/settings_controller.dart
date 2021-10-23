import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_in/sign_in_page.dart';
import 'package:gl_charge_app/routes/app_pages.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/navigation.dart';
import 'package:gl_charge_app/utils/storage.dart';

class SettingsController extends GetxController {
  final tag = "SettingsController";
  Repository repository;
  // TODO: when other stuff will be added this wil be updated
  //Rx<ApiResponse> apiSignOutResponse = Rx<ApiResponse>(ApiResponse.idle());

  signOut() async {
   await testSession("Start signOut");
   // apiSignOutResponse(ApiResponse.loading(""));
  //  await DelayHelper.delay(1);
    var res = await repository.signOut();
    if(res is SuccessState) {
     // var data = res.data as SignOutResponseModel;
      await Storage().write(Storage.SESSION_DATA, null);
      await testSession("Start SuccessState");
     // apiSignOutResponse(ApiResponse.success(data));
      Navigation.offAll(SignInPage());
    } else if(res is ErrorState) {
      await Storage().write(Storage.SESSION_DATA, null);
      await testSession("Start ErrorState");
      Navigation.offAll(SignInPage());
     // var error = res.error as String;
     // apiSignOutResponse(ApiResponse.error(false, error));
     // await DelayHelper.delay(1);
     // apiSignOutResponse(ApiResponse.idle());
    }
  }

  testSession(String aTag) async {
    var hasSession = await Storage().hasSession();
    var sessionData = await Storage().read(Storage.SESSION_DATA);
    Log.i(tag, "$aTag Session Status: $hasSession");
    Log.i(tag, "$aTag Session Data: $sessionData");
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
   // apiSignOutResponse(ApiResponse.idle());
  }
}

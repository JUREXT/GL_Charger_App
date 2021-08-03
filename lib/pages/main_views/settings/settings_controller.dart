import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/network/modern_networking/testing/api_result.dart';
import 'package:gl_charge_app/routes/app_pages.dart';
import 'package:gl_charge_app/utils/navigation.dart';
import 'package:gl_charge_app/utils/storage.dart';

class SettingsController extends GetxController {
  final tag = "SettingsController";
  Repository repository;
  // TODO: when other stuff will be added this wil be updated
  //Rx<ApiResponse> apiSignOutResponse = Rx<ApiResponse>(ApiResponse.idle());

  signOut() async {
   // apiSignOutResponse(ApiResponse.loading(""));
  //  await DelayHelper.delay(1);
    var res = await repository.signOut();
    if(res is SuccessState) {
     // var data = res.data as SignOutResponseModel;
      Storage().write(Storage.SESSION_DATA, null);
     // apiSignOutResponse(ApiResponse.success(data));
      Navigation.toNamed(Routes.SIGN_IN, null);
    } else if(res is ErrorState) {
      Storage().write(Storage.SESSION_DATA, null);
      Navigation.toNamed(Routes.SIGN_IN, null);
     // var error = res.error as String;
     // apiSignOutResponse(ApiResponse.error(false, error));
     // await DelayHelper.delay(1);
     // apiSignOutResponse(ApiResponse.idle());
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
   // apiSignOutResponse(ApiResponse.idle());
  }
}

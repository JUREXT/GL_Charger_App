import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_in/sign_in_page.dart';
import 'package:gl_charge_app/utils/navigation.dart';

class SettingsController extends GetxController {
  final tag = "SettingsController";
  Repository repository;
  // TODO: when other stuff will be added this wil be updated
  //Rx<ApiResponse> apiSignOutResponse = Rx<ApiResponse>(ApiResponse.idle());

  signOut() async {
    var res = await repository.signOut();
    if(res is SuccessState || res is ErrorState) {
      Navigation.offAll(SignInPage());
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

import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/routes/app_pages.dart';
import 'package:gl_charge_app/utils/delay_helper.dart';
import 'package:gl_charge_app/utils/navigation.dart';

class SignInController extends GetxController {
  final tag = "SignInController";
  Repository repository;
  var inputFormEnabled = true.obs;
  // var error = "";

  Rx<Resource> apiSignInResponse = Rx<Resource>(Resource.idle());

  signIn(String email, String password) async {
    inputFormEnabled(true);
    apiSignInResponse(Resource.loading(""));
    var res = await repository.signIn(email, password);
    if(res is SuccessState) {
      apiSignInResponse(Resource.success(true));  // TODO: refactor later: no data is needed here to be returned
     // Navigation.toNamed(Routes.SELECT_CHARGER, null);
      Navigation.toNamed(Routes.START_STOP_CHARGING, null);
      apiSignInResponse(Resource.idle());
    } else if(res is ErrorState) {
      inputFormEnabled(true);
      var error = res.error as String;
      apiSignInResponse(Resource.error(false, error));
    }
  }

  signInFake(String email, String password) async {
    inputFormEnabled(true);
    apiSignInResponse(Resource.loading(""));
    await DelayHelper.delay(2);
    apiSignInResponse(Resource.success(true));
    Navigation.toNamed(Routes.SELECT_CHARGER, null);
    apiSignInResponse(Resource.idle());
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
  void onClose() { }
}

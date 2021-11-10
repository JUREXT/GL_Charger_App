import 'package:get/get.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_in/sign_in_page.dart';
import 'package:gl_charge_app/utils/delay_helper.dart';
import 'package:gl_charge_app/utils/log.dart';
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

  signOutFake() async {
    await DelayHelper.delay(1);
    Navigation.offAll(SignInPage());
  }

  getAllChargersByUser() async {
    var res = await repository.getAllChargersByUser();
    if (res is SuccessState) {
      var data = res.data as List<Charger>;
    } else if (res is ErrorState) {
      var error = res.error as String;
    }
  }

  // startCharging() async {
  //   var res = await repository.startCharging();
  //   // if (res is SuccessState) {
  //   //   var data = res.data as List<Charger>;
  //   // } else if (res is ErrorState) {
  //   //   var error = res.error as String;
  //   // }
  // }
  //
  // stopCharging() async {
  //   var res = await repository.stopCharging();
  //   // if (res is SuccessState) {
  //   //   var data = res.data as List<Charger>;
  //   // } else if (res is ErrorState) {
  //   //   var error = res.error as String;
  //   // }
  // }

  getTransactionByOcppId() async {
    var res = await repository.getTransactionByOcppId();
    if (res is SuccessState) {
      var data = res.data as bool;
      Log.d(tag, "Is charging: $data");
    } else if (res is ErrorState) {
      var error = res.error as String;
      Log.d(tag, "Is charging error:  $error");
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/pages/main_views/charge/charge_controller.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/delay_helper.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/storage.dart';

class MainScreenHolderController extends GetxController {
  final tag = "SignUpController";

  Repository repository;
  Rx<ApiResponse> apiRegisterResponse = Rx<ApiResponse>(ApiResponse.idle());
  ChargeController controllerCharge = Get.find();

  int currentIndex = 1;
  PageController pageController = PageController(initialPage: 1);

  void switchTabToNewIndex(int index) {
    currentIndex = index;
    pageController.animateToPage(currentIndex, duration: Duration(milliseconds: Constants.switchSpeedMainTabsScreenHolder), curve: Curves.linear);
  }

  Future<void> setNewCharger() async {
    String chargerJson = await Storage().read(Storage.CURRENT_CHARGER_DATA);
    if (chargerJson != null) {
      Charger charger = Charger().chargerFromJson(chargerJson);
      Log.d(tag, "Current Charger :: $charger");
      await DelayHelper.delay(2);
      controllerCharge.setData(charger.chargerName);
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
    apiRegisterResponse(ApiResponse.idle());
  }
}

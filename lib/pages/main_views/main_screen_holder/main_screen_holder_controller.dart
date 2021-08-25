import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/pages/main_views/charge/charge_controller.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';

class MainScreenHolderController extends GetxController {
  final tag = "SignUpController";
  Repository repository;
  Rx<ApiResponse> apiRegisterResponse = Rx<ApiResponse>(ApiResponse.idle());

  ChargeController controllerCharge = Get.find();
  PageController pageController = PageController(initialPage: 1);
  int currentIndex = 1;

  void goToChargeTab(int index, bool outSide) {
    controllerCharge.getChargerList();
    Log.d(tag, "Page Index: $index");
    if(outSide) {
      currentIndex = 1;
    } else {
      currentIndex = index;
    }
    pageController.animateToPage(currentIndex, duration: Duration(milliseconds: Constants.switchSpeedMainTabsScreenHolder), curve: Curves.linear);
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

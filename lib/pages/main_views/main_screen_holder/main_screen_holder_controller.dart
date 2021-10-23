import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/pages/main_views/charge/charge_controller.dart';
import 'package:gl_charge_app/utils/constants.dart';

class MainScreenHolderController extends GetxController {
  final tag = "SignUpController";

  Repository repository;
  Rx<Resource> apiRegisterResponse = Rx<Resource>(Resource.idle());
  ChargeController controllerCharge = Get.find();

  int currentIndex = 1;
  PageController pageController = PageController(initialPage: 1);

  void switchTabToNewIndex(int index) {
    currentIndex = index;
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
    apiRegisterResponse(Resource.idle());
  }
}

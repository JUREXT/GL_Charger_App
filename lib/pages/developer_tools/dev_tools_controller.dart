import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';

class DevToolsController extends GetxController {
  final tag = "DevToolsController";
  Repository repository;
  Rx<Resource> apiRegisterResponse = Rx<Resource>(Resource.idle());

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

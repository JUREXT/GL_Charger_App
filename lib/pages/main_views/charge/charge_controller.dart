import 'package:get/get.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/pages/main_views/main_screen_holder/main_screen_holder_controller.dart';
import 'package:gl_charge_app/utils/log.dart';

class ChargeController extends GetxController {
  final tag = "ChargeController";
  Repository repository;
  Rx<ApiResponse> apiChargersResponse = Rx<ApiResponse>(ApiResponse.idle());

  final _chargerList = <Charger>[].obs;
  List<Charger> get chargerList => this._chargerList.value;
  set chargerList(List<Charger> value) => this._chargerList.value = value;

  var chargerNameObs = "".obs;

  void setData(String name) {
    chargerNameObs.value = name;
    Log.d(tag, "Set Data :: $name");
  }

  // startCharging() async {
  //   repository.startCharging("", "");
  // }

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
    apiChargersResponse(ApiResponse.idle());
  }
}

import 'package:get/get.dart';
import 'package:gl_charge_app/network/models/billing_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/utils/log.dart';

class ChargeController extends GetxController {
  final tag = "ChargeController";
  Repository repository;

  Rx<Resource> apiStartChargingResponse = Rx<Resource>(Resource.idle());
  Rx<Resource> apiStopChargingResponse = Rx<Resource>(Resource.idle());
  Rx<Resource> apiBillingResponse = Rx<Resource>(Resource.idle());

  startCharging() async {
    repository.startCharging("", "");
  }

  stopCharging() async {
    repository.startCharging("", "");
  }

  // getChargerList() async {
  //   chargerList = await getAllChargersByUser();
  // }

  billing() async {
    Log.d(tag, "Start Billing");
    apiBillingResponse(Resource.loading(""));
    var res = await repository.billing("");
    if(res is SuccessState) {
      var data = res.data as BillingResponseModel; // TODO: when api is available
      Log.d(tag, "Data Billing: " + data.toString());
      apiBillingResponse(Resource.success(data));
      apiBillingResponse(Resource.idle());
    } else if(res is ErrorState) {
      var error = res.error as String;
      apiBillingResponse(Resource.error(false, error));
    }
  }

  @override
  void onInit() {
    super.onInit();
    repository = Repository();
    Log.d(tag, "onInit");
  }

  @override
  void onReady() {
    super.onReady();
    Log.d(tag, "onReady");
  }

  @override
  void onClose() {
    Log.d(tag, "onClose");
  }
}

import 'package:get/get.dart';
import 'package:gl_charge_app/network/models/charger_session_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';
import 'package:gl_charge_app/network/modern_networking/charge_session.dart';
import 'package:gl_charge_app/network/modern_networking/fake_charge_session_data.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/utils/log.dart';

class ChargeSessionController extends GetxController {
  final tag = "ChargeSessionController";
  Repository repository;
  Rx<Resource> apiChargersResponse = Rx<Resource>(Resource.idle());

  final _chargerList = <ChargeSessionDTO>[].obs;
  List<ChargeSessionDTO> get chargerList => this._chargerList.value;
  set chargerList(List<ChargeSessionDTO> value) => this._chargerList.value = value;

  void getFakeList() {
    getList();
  //  chargerList = listOfFakeChargeSession;
  }

  Future<List<ChargeSessionDTO>> getList() async {
    var apiResult = await repository.getChargeSessions(1);
    if (apiResult is SuccessState) {
      var data = apiResult.data as List<ChargerSessionResponseModel>;
       Log.d(tag, "WHAT Size: " + data.length.toString());
    } else if (apiResult is ErrorState) {
      var error = apiResult.error as String;
      Log.d(tag, "WHAT FAIL: " + error);
    }
    //await DelayHelper.delay(1);
    return listOfFakeChargeSession;
  }

  @override
  void onInit() {
    super.onInit();
    repository = Repository();
    //getAllChargersByUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    apiChargersResponse(Resource.idle());
  }
}

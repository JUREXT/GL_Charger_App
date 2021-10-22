import 'package:get/get.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/charge_session.dart';
import 'package:gl_charge_app/network/modern_networking/fake_charge_session_data.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';

class ChargeSessionController extends GetxController {
  final tag = "ChargeSessionController";
  Repository repository;
  Rx<ApiResponse> apiChargersResponse = Rx<ApiResponse>(ApiResponse.idle());

  final _chargerList = <ChargeSessionDTO>[].obs;
  List<ChargeSessionDTO> get chargerList => this._chargerList.value;
  set chargerList(List<ChargeSessionDTO> value) => this._chargerList.value = value;

  void getFakeList() {
    chargerList = listOfFakeChargeSession;
  }

  // Future<List<ChargeSessionDTO>> getList() async {
  //   var chargerList = listOfFakeChargeSession;
  //   //await DelayHelper.delay(1);
  //   return chargerList;
  // }

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
    apiChargersResponse(ApiResponse.idle());
  }
}

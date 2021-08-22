import 'package:get/get.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/network/fake_data.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/utils/delay_helper.dart';

class ChargersController extends GetxController {
  final tag = "ChargersController";
  Repository repository;
  Rx<ApiResponse> apiChargersResponse = Rx<ApiResponse>(ApiResponse.idle());

  final _chargerList = <Charger>[].obs;
  List<Charger> get chargerList => this._chargerList.value;
  set chargerList(List<Charger> value) => this._chargerList.value = value;

  getChargerList() async {
    chargerList = await getAllChargersByUser();
  }

  Future<List<Charger>> getAllChargersByUser() async {
    var chargerList = listOfChargersFake;
    await DelayHelper.delay(3);
    return chargerList;
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
    apiChargersResponse(ApiResponse.idle());
  }
}

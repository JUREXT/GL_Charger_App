import 'package:get/get.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/network/modern_networking/api_response.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/storage.dart';

class ChargeController extends GetxController {
  final tag = "ChargeController";
  Repository repository;
  Rx<ApiResponse> apiChargersResponse = Rx<ApiResponse>(ApiResponse.idle());

  final _chargerList = <Charger>[].obs;
  List<Charger> get chargerList => this._chargerList.value;
  set chargerList(List<Charger> value) => this._chargerList.value = value;

  var chargerName = "".obs;

  startCharging() async {
    repository.startCharging("", "");
  }

  void getChargerList() async {
    String chargerJson = await Storage().read(Storage.CURRENT_CHARGER_DATA);
    if (chargerJson != null) {
      Charger charger = Charger().chargerFromJson(chargerJson);
      Log.d(tag, "getChargerList() :: Data $charger");
      List<Charger> list = <Charger>[];
      list.add(charger);
      chargerName.value = charger.chargerName;
      // chargerName.update((val) {
      //   Log.d(tag, "Update :: Data $val");
      // });
      chargerName.refresh();
     // chargerList = list;
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
    apiChargersResponse(ApiResponse.idle());
  }
}

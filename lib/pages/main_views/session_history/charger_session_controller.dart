import 'package:get/get.dart';
import 'package:gl_charge_app/network/charger_session.dart';
import 'package:gl_charge_app/network/modern_networking/fake_data.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';

class ChargeSessionController extends GetxController {

  final tag = "ChargeSessionController";
  Repository repository;
  Rx<Resource> apiChargersResponse = Rx<Resource>(Resource.idle());

  final _chargerList = <ChargerSession>[].obs;
  List<ChargerSession> get chargerList => this._chargerList.value;
  set chargerList(List<ChargerSession> value) => this._chargerList.value = value;

  void getFakeList() {
    chargerList = listOfFakeSessions;
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
    apiChargersResponse(Resource.idle());
  }
}

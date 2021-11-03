import 'package:get/get.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';

class ChargeSessionController extends GetxController {
  final tag = "ChargeSessionController";
  Repository repository;
  Rx<Resource> apiChargersResponse = Rx<Resource>(Resource.idle());

  final _chargerList = <Charger>[].obs;
  List<Charger> get chargerList => this._chargerList.value;
  set chargerList(List<Charger> value) => this._chargerList.value = value;

  void getFakeList() {
    chargerList = listOfFakeChargeSession;
  }

  List<Charger> listOfFakeChargeSession = [ // TODO: delete later
     Charger("1", "Test", true, true, "Here", "25", "ocppId"),
     Charger("1", "Test", true, true, "Here", "25", "ocppId"),
     Charger("1", "Test", true, true, "Here", "25", "ocppId"),
     Charger("1", "Test", true, true, "Here", "25", "ocppId"),
     Charger("1", "Test", true, true, "Here", "25", "ocppId"),
  ];

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

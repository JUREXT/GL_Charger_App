import 'package:get/get.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/network/fake_data.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';

class SelectChargerController extends GetxController {
  final tag = "SelectChargerController";
  Repository repository;
  Rx<Resource> apiChargersResponse = Rx<Resource>(Resource.idle());

  final _chargerList = <Charger>[].obs;
  List<Charger> get chargerList => this._chargerList.value;
  set chargerList(List<Charger> value) => this._chargerList.value = value;

  void getChargerList() async {
    chargerList = await getAllChargersByUser();
  }

  Future<List<Charger>> getAllChargersByUser() async {
    var chargerList = listOfChargersFake;
    //await DelayHelper.delay(1);
    return chargerList;
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

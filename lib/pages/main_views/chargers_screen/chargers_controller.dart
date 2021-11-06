import 'package:get/get.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/network/models/all_user_chargers_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/network/modern_networking/fake_data.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';

class ChargersController extends GetxController {
  final tag = "ChargersController";
  Repository repository;
  Rx<Resource> apiChargersResponse = Rx<Resource>(Resource.idle());

  final _chargerList = <Charger>[].obs;
  List<Charger> get chargerList => this._chargerList.value;
  set chargerList(List<Charger> value) => this._chargerList.value = value;

  void getAllChargersByUser() async {
    var res = await repository.getAllChargersByUser();
    if (res is SuccessState) {
      var data = res.data as List<Charger>;
      chargerList = data;
    } else if (res is ErrorState) {
      var error = res.error as String;
    }
  }

  void getAllChargersByUserFake() async {
      chargerList = listOfFakeChargers;
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

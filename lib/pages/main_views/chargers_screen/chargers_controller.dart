import 'package:get/get.dart';
import 'package:gl_charge_app/network/models/all_user_chargers_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';

class ChargersController extends GetxController {
  final tag = "ChargersController";
  Repository repository;
  Rx<Resource> apiChargersResponse = Rx<Resource>(Resource.idle());

  final _chargerList = <AllUserChargersResponseModel>[].obs;
  List<AllUserChargersResponseModel> get chargerList => this._chargerList.value;
  set chargerList(List<AllUserChargersResponseModel> value) => this._chargerList.value = value;

  void getAllChargersByUser() async {
    var res = await repository.getAllChargersByUser();
    if (res is SuccessState) {
      var data = res.data as List<AllUserChargersResponseModel>;
      chargerList = data;
    } else if (res is ErrorState) {
      var error = res.error as String;
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
    apiChargersResponse(Resource.idle());
  }
}

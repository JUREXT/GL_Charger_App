import 'package:get/get.dart';
import 'package:gl_charge_app/network/models/register_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/utils/delay_helper.dart';

class SignUpController extends GetxController {
  final tag = "SignUpController";
  Repository repository;
  var inputFormEnabled = true.obs;
  // var error = "";

  Rx<Resource> apiRegisterResponse = Rx<Resource>(Resource.idle());

  register(String username, String firstname, String lastname, String email, String password) async {
    inputFormEnabled(false);
    apiRegisterResponse(Resource.loading(""));
    await DelayHelper.delay(1);
    var res = await repository.register(username, firstname, lastname, email, password);
    if(res is SuccessState) {
      var data = res.data as RegisterResponseModel;
      apiRegisterResponse(Resource.success(data));
      await DelayHelper.delay(1);
      apiRegisterResponse(Resource.idle());
    } else if(res is ErrorState) {
      inputFormEnabled(true);
      var error = res.error as String;
      apiRegisterResponse(Resource.error(false, error));
      await DelayHelper.delay(1);
      apiRegisterResponse(Resource.idle());
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
    apiRegisterResponse(Resource.idle());
  }
}

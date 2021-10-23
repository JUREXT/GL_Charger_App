import 'package:get/get.dart';
import 'package:gl_charge_app/network/models/sign_in_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/resource.dart';
import 'package:gl_charge_app/network/modern_networking/repository.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/utils/delay_helper.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/storage.dart';

class SignInController extends GetxController {
  final tag = "SignInController";
  Repository repository;
  var inputFormEnabled = true.obs;
  // var error = "";

  Rx<Resource> apiSignInResponse = Rx<Resource>(Resource.idle());

  signIn(String email, String password) async {
    inputFormEnabled(true);
    apiSignInResponse(Resource.loading(""));
   // await DelayHelper.delay(2);
    var res = await repository.signIn(email, password);
    if(res is SuccessState) {
      var data = res.data as SignInResponseModel;

      await Storage().write(Storage.SESSION_DATA, data.toJson().toString()); // TODO: update flow
      await DelayHelper.delay(2);
      Log.d(tag, "Session data ${await Storage().read(Storage.SESSION_DATA)}");
      Log.d(tag, "Data ${data.toString()}");

      apiSignInResponse(Resource.success(data));
      await DelayHelper.delay(1);
      //apiSignInResponse(Resource.idle());
    } else if(res is ErrorState) {
      inputFormEnabled(true);
      var error = res.error as String;
      apiSignInResponse(Resource.error(false, error));
      await DelayHelper.delay(1);
      apiSignInResponse(Resource.idle());
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
    apiSignInResponse(Resource.idle());
  }
}

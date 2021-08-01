import 'package:gl_charge_app/network/modern_networking/testing/test_obj.dart';
import 'package:gl_charge_app/network/modern_networking/testing/user_log_in.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'api_base_helper.dart';
import 'api_positive_negative_response.dart';

class Repository {
  var tag = "Repository";
  ApiBaseHelper api = ApiBaseHelper();

  Future<ApiResult> fetchTest() async {
     var apiRes = await api.get(Constants.testEndPoint);
     if(apiRes.status == ResponseStatus.POSITIVE) {
       Log.d(tag, "ResponseStatus.POSITIVE: " + apiRes.data.toString());
       return ApiResult.success(TestObj.fromJson(apiRes.data));
     } else {
       Log.d(tag, "ResponseStatus.NEGATIVE: " + apiRes.data.toString());
       return ApiResult.error("Url problem");
     }
  }
}

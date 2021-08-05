import 'package:gl_charge_app/network/models/all_chargers_by_user_data_model.dart';
import 'package:gl_charge_app/network/models/all_chargers_by_user_response_model.dart';
import 'package:gl_charge_app/network/models/forgot_password_data_model.dart';
import 'package:gl_charge_app/network/models/forgot_password_response_model.dart';
import 'package:gl_charge_app/network/models/register_data_model.dart';
import 'package:gl_charge_app/network/models/register_response_model.dart';
import 'package:gl_charge_app/network/models/sign_out_response_model.dart';
import 'package:gl_charge_app/network/models/start_charging_data_model.dart';
import 'package:gl_charge_app/network/models/start_charging_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/testing/test_obj.dart';
import 'package:gl_charge_app/network/modern_networking/testing/api_result.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'api_base_helper.dart';
import 'api_positive_negative_response.dart';

class Repository {
  var tag = "Repository";
  ApiBaseHelper api = ApiBaseHelper();

  Future<ApiResult> signIn(String email, String password) async { // TODO: in progress, needs passing real data
     var apiRes = await api.get(Constants.testEndPoint);
     if(apiRes.status == ResponseStatus.POSITIVE) {
       Log.d(tag, "ResponseStatus.POSITIVE: " + apiRes.data.toString());
       return ApiResult.success(TestObj.fromJson(apiRes.data));
     } else {
       Log.d(tag, "ResponseStatus.NEGATIVE: " + apiRes.data.toString());
       return ApiResult.error("Url problem");
     }
  }

  Future<ApiResult> signOut() async {
    var apiRes = await api.post(Constants.signOutEp, null);
    if(apiRes.status == ResponseStatus.POSITIVE) {
      Log.d(tag, "ResponseStatus.POSITIVE: " + apiRes.data.toString());
      return ApiResult.success(SignOutResponseModel.fromJson(apiRes.data));
    } else {
      Log.d(tag, "ResponseStatus.NEGATIVE: " + apiRes.data.toString());
      return ApiResult.error("Url problem");
    }
  }

  Future<ApiResult> register(String username, String firstname, String lastname, String email, String password) async {
    var json = RegisterDataModel(username: username, firstname: firstname, lastname: lastname, email: email, password: password).toJson();
    var apiRes = await api.post(Constants.registerEp, json);
    if(apiRes.status == ResponseStatus.POSITIVE) {
      Log.d(tag, "ResponseStatus.POSITIVE: " + apiRes.data.toString());
      return ApiResult.success(RegisterResponseModel.fromJson(apiRes.data));
    } else {
      Log.d(tag, "ResponseStatus.NEGATIVE: " + apiRes.data.toString());
      return ApiResult.error("Url problem");
    }
  }

  Future<ApiResult> forgotPassword(String resetPasswordToken, String password) async {
    var json = ForgotPasswordDataModel(resetPasswordToken: resetPasswordToken, password: password).toJson();
    var apiRes = await api.post(Constants.forgotPasswordEp, json);
    if(apiRes.status == ResponseStatus.POSITIVE) {
      Log.d(tag, "ResponseStatus.POSITIVE: " + apiRes.data.toString());
      return ApiResult.success(ForgotPasswordResponseModel.fromJson(apiRes.data));
    } else {
      Log.d(tag, "ResponseStatus.NEGATIVE: " + apiRes.data.toString());
      return ApiResult.error("Url problem");
    }
  }

  Future<ApiResult> getAllChargersByUser(int userId) async {
    var json = AllChargersByUserDataModel(userid: userId).toJson();
    var apiRes = await api.post(Constants.allChargersByUserEp, json);
    if(apiRes.status == ResponseStatus.POSITIVE) {
      Log.d(tag, "ResponseStatus.POSITIVE: " + apiRes.data.toString());
      return ApiResult.success(AllChargersByUserResponseModel.fromJson(apiRes.data));
    } else {
      Log.d(tag, "ResponseStatus.NEGATIVE: " + apiRes.data.toString());
      return ApiResult.error("Url problem");
    }
  }

  Future<ApiResult> startCharging(String id, String profileId) async {
    var json = StartChargingDataModel(id: id, profileId: profileId).toJson();
    var apiRes = await api.post(Constants.startChargingEp, json);
    if(apiRes.status == ResponseStatus.POSITIVE) {
      Log.d(tag, "ResponseStatus.POSITIVE: " + apiRes.data.toString());
      return ApiResult.success(StartChargingResponseModel.fromJson(apiRes.data));
    } else {
      Log.d(tag, "ResponseStatus.NEGATIVE: " + apiRes.data.toString());
      return ApiResult.error("Url problem");
    }
  }

}

import 'dart:convert';

import 'package:gl_charge_app/network/models/all_chargers_by_user_data_model.dart';
import 'package:gl_charge_app/network/models/all_chargers_by_user_response_model.dart';
import 'package:gl_charge_app/network/models/charger_session_response_model.dart';
import 'package:gl_charge_app/network/models/forgot_password_data_model.dart';
import 'package:gl_charge_app/network/models/forgot_password_response_model.dart';
import 'package:gl_charge_app/network/models/register_data_model.dart';
import 'package:gl_charge_app/network/models/register_response_model.dart';
import 'package:gl_charge_app/network/models/sign_in_data_model.dart';
import 'package:gl_charge_app/network/models/sign_in_response_model.dart';
import 'package:gl_charge_app/network/models/sign_out_data_model.dart';
import 'package:gl_charge_app/network/models/sign_out_response_model.dart';
import 'package:gl_charge_app/network/models/start_charging_data_model.dart';
import 'package:gl_charge_app/network/models/start_charging_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/storage.dart';
import 'api_base_helper.dart';
import 'api_response_resource.dart';

class Repository {
  var tag = "Repository";
  ApiBaseHelper api = ApiBaseHelper();

  Future<ApiResult> signIn(String email, String password) async {

    // try {
    //
    // } catch() {
    //
    // }

    var paramJson = SignInDataModel(email: email, password: password).toJson(); // add try cathh
    Log.d(tag, "PARAMS: " + paramJson.toString());
    var apiResource = await api.post(Constants.LOG_IN, paramJson);
    if (apiResource.status == ResponseStatus.POSITIVE) {
      var model = SignInResponseModel.fromJson(apiResource.data);
      await Storage().write(Storage.SESSION_DATA, SignInResponseModel().modelToJson(model));
      return ApiResult.success(true);
    } else if (apiResource.status == ResponseStatus.NEGATIVE) {
      String error = apiResource.error;
      return ApiResult.error(error);
    }
    return ApiResult.error("-1");
  }

  Future<ApiResult> signOut() async {
    SignInResponseModel signInResponseModel;
    String signInResponseModelJson = await Storage().read(Storage.SESSION_DATA);

    if (signInResponseModelJson != null) {
        signInResponseModel = SignInResponseModel().modelFromJson(signInResponseModelJson);
        var paramJson = SignOutDataModel(refreshToken: signInResponseModel.refreshToken).toJson();
       // Log.d(tag, "PARAMS: " + paramJson.toString());

        var apiResource = await api.post(Constants.LOG_OUT, paramJson);
        if(apiResource.status == ResponseStatus.POSITIVE) {
          await Storage().write(Storage.SESSION_DATA, null);
          return ApiResult.success(true);
        } else {
          await Storage().write(Storage.SESSION_DATA, null);
          String error = apiResource.error;
          return ApiResult.error(error);
        }
    } else {
      await Storage().write(Storage.SESSION_DATA, null);
      return ApiResult.error("No session data");
    }
  }

  Future<ApiResult> register(String username, String firstname, String lastname, String email, String password) async {
    var json = RegisterDataModel(username: username, firstname: firstname, lastname: lastname, email: email, password: password).toJson();
    var apiRes = await api.post(Constants.REGISTER, json);
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
    var apiRes = await api.post(Constants.RESET_PASSWORD, json);
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
    var apiRes = await api.post(Constants.ALL_CHARGERS_BY_USER, json);
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
    var apiRes = await api.post(/*Constants.startChargingEp*/ "", json); // TODO:
    if(apiRes.status == ResponseStatus.POSITIVE) {
      Log.d(tag, "ResponseStatus.POSITIVE: " + apiRes.data.toString());
      return ApiResult.success(StartChargingResponseModel.fromJson(apiRes.data));
    } else {
      Log.d(tag, "ResponseStatus.NEGATIVE: " + apiRes.data.toString());
      return ApiResult.error("Url problem");
    }
  }

  Future<ApiResult> getChargeSessions(int id) async {
    //var json = ChargeSessionDataModel(id: id).toJson();
    var apiResource = await api.get(/*Constants.chargeSessionByUserEp*/""); // TODO:
    // Log.d(tag, "DIRECT: " + apiRes.data);

    //final parsed = jsonDecode(apiRes.data).cast<Map<String, dynamic>>();
    // Log.d(tag, "DIRECT: Status:" + apiRes.status.toString());
    // Log.d(tag, "DIRECT: DATA:" + apiRes.data.toString());

    //Map myMap = apiRes.data[0]; // parse single on index
    // List myMapList = apiRes.data; // parse list

    // ChargerSessionResponseModel test = ChargerSessionResponseModel.fromJson(myMap);
    // Log.d(tag, "DIRECT: Parse Index 1: " + test.toString());

    // var list = myMapList.map((job) => new ChargerSessionResponseModel.fromJson(job)).toList();
    // list.forEach((it) {
    //   Log.d(tag, "ITEM: Item:" + it.toString());
    // });
    // return ApiResult.success(ChargerSessionResponseModel.fromJson(apiRes.data));

    if (apiResource.status == ResponseStatus.POSITIVE) {
      List myMapList = apiResource.data;
      var list = myMapList
          .map((it) => ChargerSessionResponseModel.fromJson(it))
          .toList();
      return ApiResult.success(list);
    } else if (apiResource.status == ResponseStatus.NEGATIVE) {
      String error = apiResource.error;
      return ApiResult.error(error);
    }
    return ApiResult.error("-1");
  }
}

import 'package:gl_charge_app/network/models/all_chargers_by_user_data_model.dart';
import 'package:gl_charge_app/network/models/all_chargers_by_user_response_model.dart';
import 'package:gl_charge_app/network/models/all_user_chargers_data_model.dart';
import 'package:gl_charge_app/network/models/all_user_chargers_response_model.dart';
import 'package:gl_charge_app/network/models/billing_data_model.dart';
import 'package:gl_charge_app/network/models/billing_response_model.dart';
import 'package:gl_charge_app/network/models/charger_session_response_model.dart';
import 'package:gl_charge_app/network/models/forgot_password_data_model.dart';
import 'package:gl_charge_app/network/models/forgot_password_response_model.dart';
import 'package:gl_charge_app/network/models/register_data_model.dart';
import 'package:gl_charge_app/network/models/register_response_model.dart';
import 'package:gl_charge_app/network/models/sign_in_data_model.dart';
import 'package:gl_charge_app/network/models/sign_in_response_model.dart';
import 'package:gl_charge_app/network/models/sign_out_data_model.dart';
import 'package:gl_charge_app/network/models/start_charging_data_model.dart';
import 'package:gl_charge_app/network/models/start_charging_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/storage.dart';
import '../charger.dart';
import 'api_base_helper.dart';
import 'api_end_point.dart';
import 'api_response_resource.dart';
import 'headers.dart';

class Repository {
  var tag = "Repository";
  ApiBaseHelper api = ApiBaseHelper();

  Future<ApiResult> signIn(String email, String password) async {
    try {
      var paramJson = SignInDataModel(email: email, password: password).toJson();
      Log.d(tag, "PARAMS: " + paramJson.toString());
      var apiResource = await api.post(Api_V1.LOG_IN, paramJson, Headers.headers());
      if (apiResource.status == ResponseStatus.POSITIVE) {
        var model = SignInResponseModel.fromJson(apiResource.data);
       // await Storage().write(Storage.SESSION_DATA, SignInResponseModel().modelToJson(model));
        await Storage().storeSession(model);
        return ApiResult.success(true);
      } else if (apiResource.status == ResponseStatus.NEGATIVE) {
        String error = apiResource.error;
        return ApiResult.error(error);
      }
      return ApiResult.error("-1");
    } catch (ex) {
      return ApiResult.error("-1" + ex.toString());
    }
  }

  Future<ApiResult> signOut() async {
    try {
      SignInResponseModel signInResponseModel = await Storage().readSession();

      if (signInResponseModel != null) {
        var paramJson = SignOutDataModel(refreshToken: signInResponseModel.refreshToken).toJson();
        // Log.d(tag, "PARAMS: " + paramJson.toString());

        var apiResource = await api.post(Api_V1.LOG_OUT, paramJson, Headers.headers());
        if(apiResource.status == ResponseStatus.POSITIVE) {
          await Storage().destroySession();
          return ApiResult.success(true);
        } else {
          await Storage().destroySession();
          String error = apiResource.error;
          return ApiResult.error(error);
        }
      } else {
        await Storage().destroySession();
        return ApiResult.error("No session data");
      }
    } catch(ex) {
      await Storage().destroySession();
      return ApiResult.error("No session data");
    }
  }

  Future<ApiResult> register(String username, String firstname, String lastname, String email, String password) async {
    var json = RegisterDataModel(username: username, firstname: firstname, lastname: lastname, email: email, password: password).toJson();
    var apiRes = await api.post(Api_V1.REGISTER, json, Headers.headers());
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
    var apiRes = await api.post(Api_V1.RESET_PASSWORD, json, Headers.headers());
    if(apiRes.status == ResponseStatus.POSITIVE) {
      Log.d(tag, "ResponseStatus.POSITIVE: " + apiRes.data.toString());
      return ApiResult.success(ForgotPasswordResponseModel.fromJson(apiRes.data));
    } else {
      Log.d(tag, "ResponseStatus.NEGATIVE: " + apiRes.data.toString());
      return ApiResult.error("Url problem");
    }
  }

  Future<ApiResult> billing(String id) async {
    try {
      var paramJson = BillingDataModel(email: "eve.holt@reqres.in", password: "cityslicka").toJson();
      Log.d(tag, "PARAMS: " + paramJson.toString());
      var apiResource = await api.post(Api_V1.BILLING, paramJson, Headers.headers());
      if (apiResource.status == ResponseStatus.POSITIVE) {
        var model = BillingResponseModel.fromJson(apiResource.data);
        return ApiResult.success(model);
      } else if (apiResource.status == ResponseStatus.NEGATIVE) {
        String error = apiResource.error;
        return ApiResult.error(error);
      }
      return ApiResult.error("-1");
    } catch (ex) {
      return ApiResult.error("-1");
    }
  }

  Future<ApiResult> getAllChargersByUser() async {
    SignInResponseModel session = await Storage().readSession();
    Log.d(tag, "User ID: " + session.id);
    var json = AllUserChargersDataModel(id: session.id).toJson();
    var apiRes = await api.post(Api_V1.ALL_CHARGERS_BY_USER, json, Headers.authHeader(session.accessToken));
    if(apiRes.status == ResponseStatus.POSITIVE) {
      Log.d(tag, "ResponseStatus.POSITIVE: " + apiRes.data.toString());
      List<AllUserChargersResponseModel> list = AllUserChargersResponseModel.parseList(apiRes.data);
      List<Charger> listNew = AllUserChargersResponseModel.modifyListAndConvert(list);
      listNew.forEach((it) {
        Log.d(tag, "NEW :: Charger ID:" + it.id + " Name: " + it.name + " ocppId: " + it.ocppId);
      });
      return ApiResult.success(listNew);
    } else {
      Log.d(tag, "ResponseStatus.NEGATIVE: " + apiRes.data.toString());
      return ApiResult.error("Url problem");
    }
  }

  Future<ApiResult> startCharging(String id, String profileId) async {
    var json = StartChargingDataModel(id: id, profileId: profileId).toJson();
    var apiRes = await api.post(/*Constants.startChargingEp*/ "", json, Headers.headers()); // TODO: in progress
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
   // var apiResource = await api.get(/*Constants.chargeSessionByUserEp*/"", Had); // TODO:
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

    // if (apiResource.status == ResponseStatus.POSITIVE) {
    //   List myMapList = apiResource.data;
    //   var list = myMapList.map((it) => ChargerSessionResponseModel.fromJson(it)).toList();
    //   return ApiResult.success(list);
    // } else if (apiResource.status == ResponseStatus.NEGATIVE) {
    //   String error = apiResource.error;
    //   return ApiResult.error(error);
    // }
    return ApiResult.error("-1");
  }
}

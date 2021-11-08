import 'dart:convert';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/network/models/all_user_chargers_data_model.dart';
import 'package:gl_charge_app/network/models/all_user_chargers_response_model.dart';
import 'package:gl_charge_app/network/models/billing_data_model.dart';
import 'package:gl_charge_app/network/models/billing_response_model.dart';
import 'package:gl_charge_app/network/models/forgot_password_data_model.dart';
import 'package:gl_charge_app/network/models/forgot_password_response_model.dart';
import 'package:gl_charge_app/network/models/register_data_model.dart';
import 'package:gl_charge_app/network/models/register_response_model.dart';
import 'package:gl_charge_app/network/models/sign_in_data_model.dart';
import 'package:gl_charge_app/network/models/sign_in_response_model.dart';
import 'package:gl_charge_app/network/models/sign_out_data_model.dart';
import 'package:gl_charge_app/network/models/start_charging_data_model.dart';
import 'package:gl_charge_app/network/models/start_charging_response_model.dart';
import 'package:gl_charge_app/network/models/stop_charging_data_model.dart';
import 'package:gl_charge_app/network/models/verify_if_charging_data_model.dart';
import 'package:gl_charge_app/network/models/verify_if_charging_response_model.dart';
import 'package:gl_charge_app/network/modern_networking/api_result.dart';
import 'package:gl_charge_app/network/modern_networking/json_encoder_helper.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:gl_charge_app/utils/sha256.dart';
import 'package:gl_charge_app/utils/storage.dart';
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

  Future<ApiResult> startCharging() async {
   // var session = await Storage().readSession();
   // Log.d(tag, "Session: " + session.toString());
   // var charger = await Storage().getSelectedChargerData();
   //Log.d(tag, "Charger: " + charger.toString());

    var userUUID = "f1acf4d5-8e63-42a3-b27e-c0e328867421"; // hardcoded or session.id
   // var userUUID = session.id;
    //var ocppId = "SI*GLC*E123456*1001*1"; // dobis iz liste or  charger.ocppId + "*1"
    var ocppId = "SI*GLC*E123456*1003*1";

    var data = DataStart(ocppId: ocppId, userUUID: userUUID, command: Constants.START_CHARGING_COMMAND, parameters:  ParametersStart(current: "15"));
    var json = StartChargingDataModel(app: Constants.APP_NAME, data: data).toJson();
    Log.d(tag, "Start Charge Data: $json");

    var jsonConverted = JsonEncoderHelper.convertJson(json);
    var signature = SHA256.getSHA256Signature(jsonConverted);
    Log.d(tag, "Signature: $signature");
    var headers = Headers.headerWithSignature(signature);
    Log.d(tag, "Header: " + headers.toString());

    var apiRes = await api.post(Api_V1.REMOTE_COMMAND_CHARGING, jsonEncode(json), headers);

    if(apiRes.status == ResponseStatus.POSITIVE) {
      Log.d(tag, "ResponseStatus.POSITIVE: " + apiRes.data.toString());
      var model = StartChargingResponseModel.fromJson(apiRes.data);
      Log.d(tag, "Model data: " + model.toString());
      await Storage().setSelectedChargerTransactionId(model.transactionId.toString());

      //var transactionId = await Storage().getSelectedChargerTransactionId();

      //return ApiResult.success(StartChargingResponseModel.fromJson(apiRes.data));
     // return ApiResult.error("Url problem");
    } else if(apiRes.status == ResponseStatus.NEGATIVE) {
      Log.d(tag, "ResponseStatus.NEGATIVE: " + apiRes.error);
      //return ApiResult.error("Url problem");
    }

    return ApiResult.error("Url problem");
  }

  Future<ApiResult> stopCharging() async { // transactionId comes from start response
  //  var session = await Storage().readSession();
   // Log.d(tag, "startStopCharging Session: " + session.toString());
   // var charger = await Storage().getSelectedChargerData();

    var userUUID = "f1acf4d5-8e63-42a3-b27e-c0e328867421"; // hardcoded or session.id
    var ocppId = "SI*GLC*E123456*1003*1";

    var transactionId = await Storage().getSelectedChargerTransactionId();
    if(transactionId == null) {
      Log.d(tag, "Transaction Id is null - not good");
    }

    var data = DataStop(ocppId: ocppId, userUUID: userUUID, command: Constants.STOP_CHARGING_COMMAND, parameters: ParametersStop(transactionId: transactionId));
    var json = StopChargingDataModel(app: Constants.APP_NAME, data: data).toJson();
    Log.d(tag, "Start Charge Data: $json");

    var jsonConverted = JsonEncoderHelper.convertJson(json);
    var signature = SHA256.getSHA256Signature(jsonConverted);
    Log.d(tag, "Signature: $signature");
    var headers = Headers.headerWithSignature(signature);
    Log.d(tag, "Header: " + headers.toString());

    var apiRes = await api.post(Api_V1.REMOTE_COMMAND_CHARGING, jsonEncode(json), headers);

    if(apiRes.status == ResponseStatus.POSITIVE) {
      Log.d(tag, "ResponseStatus.POSITIVE: " + apiRes.data.toString());
     // return ApiResult.success(StartChargingResponseModel.fromJson(apiRes.data));
    } else {
      Log.d(tag, "ResponseStatus.NEGATIVE: " + apiRes.data.toString());
      //return ApiResult.error("Url problem");
    }

    return ApiResult.error("Url problem");
  }

  Future<ApiResult> getTransactionByOcppId() async {
    SignInResponseModel session = await Storage().readSession();
    Log.d(tag, "User ID: " + session.id);

    var ocppId = "SI*GLC*E123456*1003";
    var json = VerifyIfChargingDataModel(ocppId: ocppId).toJson();

    var apiRes = await api.post(Api_V1.GET_TRANSACTION_BY_OCPP_ID, /*jsonEncode(json)*/ json, Headers.authHeader(session.accessToken));

    if(apiRes.status == ResponseStatus.POSITIVE) {
      Log.d(tag, "ResponseStatus.POSITIVE: " + apiRes.data.toString());
      var model = VerifyIfChargingResponseModel.fromJson(apiRes.data);
      Log.d(tag, model.toString());
      // return ApiResult.success(StartChargingResponseModel.fromJson(apiRes.data));
      if(model.stopReason == null) {
        Log.d(tag, "Charger is running!");
      } else {
        Log.d(tag, "Charger is not running!");
      }
    } else {
      Log.d(tag, "ResponseStatus.NEGATIVE: " + apiRes.data.toString());
      //return ApiResult.error("Url problem");
    }

    return ApiResult.error("Url problem");
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

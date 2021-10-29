import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gl_charge_app/network/charger.dart';
import 'package:gl_charge_app/network/models/sign_in_response_model.dart';
import 'package:gl_charge_app/translations/app_locale.dart';

import 'log.dart';

class Storage {
  var tag = "Storage";
  var storage;
  static const SESSION_DATA = 'session_data'; // null can be stored and checked
  static const CURRENT_CHARGER_DATA = 'current_charger'; // null can be stored and checked
  static const CURRENT_LOCALE_DATA = 'current_locale'; // null can be stored and checked

  //#region Storage handling
  Storage() {
    storage = GetStorage();
  }

  Future<void> write(String key, String value) async {
    await storage.write(key, value);
  }

  Future<String> read(String key) async {
    var val = await storage.read(key);
    return val;
  }

  Future<void> erase() async {
    await storage.erase();
  }
  //#endregion

  //#region Session handling
  Future<bool> hasSession() async {
    if (await storage.read(SESSION_DATA) == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> storeSession(SignInResponseModel model) async {
    await Storage().write(Storage.SESSION_DATA, SignInResponseModel().modelToJson(model));
  }

  Future<SignInResponseModel> readSession() async {
    String signInResponseModelJson = await Storage().read(Storage.SESSION_DATA);
    if (signInResponseModelJson != null) {
      SignInResponseModel signInResponseModel = SignInResponseModel().modelFromJson(signInResponseModelJson);
      return signInResponseModel;
    } else {
      return null;
    }
  }

  Future<void> destroySession() async {
    await Storage().write(Storage.SESSION_DATA, null);
  }
  //#endregion

  //#region Locale handling
  Future<void> setLocale(String localeName) async {
    await Storage().write(Storage.CURRENT_LOCALE_DATA, localeName);
  }

  Future<Locale> getLocale() async {
    String localeName = await Storage().read(Storage.CURRENT_LOCALE_DATA);
    if (localeName != null) {
      if (localeName == AppLocaleList.localeUS.localeName) {
        return AppLocaleList.localeUS.locale;
      } else if (localeName == AppLocaleList.localeSI.localeName) {
        return AppLocaleList.localeSI.locale;
      } else {
        //return AppLocaleList.localeSI.locale;
        return AppLocaleList.localeUS.locale; // TODO: force en locale, temporary
      }
    } else {
      //return AppLocaleList.localeSI.locale;
      return AppLocaleList.localeUS.locale; // TODO: force en locale, temporary
    }
  }
 //#endregion

 //#region Selected Charger For Charging handling
  Future<Charger> getSelectedChargerData() async {
    String chargerJson = await Storage().read(Storage.CURRENT_CHARGER_DATA);
    if (chargerJson != null) {
      Charger charger = Charger.chargerFromJson(chargerJson);
      Log.d(tag, "getData Charger :: ${charger.id} || ${charger.name}");
      return charger;
    } else {
      return null;
    }
  }

  Future<void> setSelectedChargerData(Charger charger) async {
    Log.d(tag, "setData Charger :: ${charger.id} || ${charger.name}");
    await Storage().write(Storage.CURRENT_CHARGER_DATA, Charger.chargerToJson(charger));
  }
 //#endregion

}

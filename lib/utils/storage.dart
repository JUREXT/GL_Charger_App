import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gl_charge_app/translations/app_locale.dart';

class Storage {
  var storage;
  static const SESSION_DATA = 'session_data'; // null can be stored and checked
  static const CURRENT_CHARGER_DATA = 'current_charger'; // null can be stored and checked
  static const CURRENT_LOCALE_DATA = 'current_locale'; // null can be stored and checked

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

  Future<bool> hasSession() async {
    if (await storage.read(SESSION_DATA) == null) {
      return false;
    } else {
      return true;
    }
  }

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
        return AppLocaleList.localeSI.locale;
      }
    } else {
      return AppLocaleList.localeSI.locale;
    }
  }
}

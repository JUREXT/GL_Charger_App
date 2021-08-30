import 'package:flutter/material.dart';

class AppLocale {
  String localeName;
  Locale locale;
  AppLocale(this.localeName, this.locale);
}

class AppLocaleList {
  static AppLocale localeUS = AppLocale('English', Locale("en", "US"));
  static AppLocale localeSI = AppLocale('Slovenian', Locale("sl", "SI"));

  static var locales = [
    {"name": localeUS.localeName, "locale": localeUS.locale },
    {"name": localeSI.localeName, "locale": localeSI.locale }
  ];
}

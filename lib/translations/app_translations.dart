import 'package:flutter/cupertino.dart';

import 'en_US/en_us_translations.dart';
import 'sl_SL/sl_sl_translations.dart';

// https://saimana.com/list-of-country-locale-code/
abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUS,
    'sl_SI': slSl
  };

  static const localeNameUS = 'English';
  static const localeNameSI = 'Slovenian';
  static const Locale enLocale = Locale("en", "US");
  static const Locale slLocale = Locale("sl", "SI");

  static const locales = [
    {"name": localeNameUS, "locale": enLocale },
    {"name": localeNameSI, "locale": slLocale }
  ];
}

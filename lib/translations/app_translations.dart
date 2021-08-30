import 'en_US/en_us_translations.dart';
import 'sl_SL/sl_sl_translations.dart';

// https://saimana.com/list-of-country-locale-code/
abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUS,
    'sl_SI': slSl
  };
}

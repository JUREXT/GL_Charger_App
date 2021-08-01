import 'en_US/en_us_translations.dart';
import 'sl_SL/sl_sl_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUs,
    'sl_SL': slSl
  };
}

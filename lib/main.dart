import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_in/sign_in_binding.dart';
import 'package:gl_charge_app/translations/app_locale.dart';
import 'package:gl_charge_app/utils/storage.dart';
import 'routes/app_pages.dart';
import 'translations/app_translations.dart';
import 'utils/config.dart';
import 'utils/log.dart';

Future<void> main() async {
  var tag ="main";
  WidgetsFlutterBinding.ensureInitialized();
  await Config.init();
  Log.enableLogger(true);
  Log.i(tag, "Main Started");
  //var startPage = (await Storage().hasSession()) ? Routes.MAIN_TAB_HOLDER : AppPages.INITIAL;
  var startPage = (await Storage().hasSession()) ? Routes.START_STOP_CHARGING : AppPages.INITIAL;
  Locale locale = await Storage().getLocale();
  runApp(MyApp(startPage, locale));
}

class MyApp extends StatelessWidget {
  final String startPage;
  final Locale locale;
  MyApp (this.startPage, this.locale);

  @override
  Widget build(BuildContext context) {
    var tag ="MyApp";
    Log.d(tag, "Start Screen Based on Session Availability: $startPage");
    Log.d(tag, "Current Locale: $locale");

    return GetMaterialApp(
     // title: 'App',
      theme: ThemeData(
       // primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
       // textTheme: GoogleFonts.muliTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Duration(milliseconds: 500),
      initialBinding: SignInBinding(),
      initialRoute: startPage,
      getPages: AppPages.routes,
      locale: locale,
      fallbackLocale: AppLocaleList.localeUS.locale,
      translationsKeys: AppTranslation.translations,
    );
  }
}

// https://pub.dev/packages/sizer // https://stackoverflow.com/questions/49704497/how-to-make-flutter-app-responsive-according-to-different-screen-size
// https://www.geeksforgeeks.org/how-to-add-images-in-flutter-app/
// https://fluttergems.dev/switch/
// https://pusher.com/tutorials/flutter-listviews
// https://blog.logrocket.com/flutter-tabbar-a-complete-tutorial-with-examples/
// https://www.woolha.com/tutorials/flutter-display-and-adjust-images-from-assets
// https://fluttercorner.com/how-to-create-rounded-button-with-border-radius-in-flutter/
// https://educity.app/flutter/create-a-button-with-border-radius
// https://flutter.dev/docs/cookbook/gestures/ripples // https://medium.com/@yuvrajpandey24/working-with-raised-button-in-flutter-6f5c0f71aab3
// https://pub.dev/packages/tap_debouncer
// MVVM-REST https://morioh.com/p/065577fc11ef?f=5c21fb01c16e2556b555ab32&fbclid=IwAR1jxZXadxJsY30grdYGReuksH8N2AsYAI0Rb-q-KvPYTDU5jtsuVGWC-Hw
// App Bar Navigation Rules https://stackoverflow.com/questions/44978216/flutter-remove-back-button-on-appbar
// App Example: https://github.com/GeekySingh/flutter_stacked_architecture_with_retrofit
// OK: https://github.com/azamsharp/Movies-App-Flutter-MVVM -- https://morioh.com/p/065577fc11ef?f=5c21fb01c16e2556b555ab32&fbclid=IwAR1jxZXadxJsY30grdYGReuksH8N2AsYAI0Rb-q-KvPYTDU5jtsuVGWC-Hw
// Form Validatin: https://www.youtube.com/watch?v=m9Mc2Ze_-hE
// Release APP: https://morioh.com/p/aa2300ef37f8?f=5c21fb01c16e2556b555ab32&fbclid=IwAR0IIniVcLWXx1e9BSsknV4HFHzZr7Srzc_09nNVhL0TlQyn7beVLXCRxuU
// Learn stuff: https://medium.com/swlh/the-differences-between-provider-pattern-and-bloc-pattern-fc93dc523672
// https://dev.to/dzun_n/no-need-postman-your-vscode-is-enough-for-testing-your-api-2khg?fbclid=IwAR2dfvO1tJzOJ4CFyqoQyR1VkyZ65UmFI4vC3SzsAwT_r2nLJy_KXaPr88A
// UI Studio: https://jetspike.medium.com/introducing-flutter-widget-designer-with-built-in-data-binding-958a1ca33fc2

// GOOD: https://pub.dev/packages/back_button_interceptor
// https://mightytechno.com/rounded-button-flutter/

// GOOD: https://www.youtube.com/watch?v=V0oxG3tWiwk

// FIGMA: https://www.figma.com/file/BElgazWy5gDg3Y4xuNM93I/Applications?node-id=0%3A1

// INTRO: https://github.com/duytq94/flutter-intro-slider

// POST DATA: https://www.youtube.com/watch?v=C0gz3Eg9cx4

// https://pub.dev/packages/disable_battery_optimization/example
// https://medium.com/vrt-digital-studio/flutter-workmanager-81e0cfbd6f6e

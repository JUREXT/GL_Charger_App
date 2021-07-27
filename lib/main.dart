import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'routes/app_pages.dart';
import 'utils/config.dart';
import 'utils/log.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Config.init();
  runApp(MyApp());
  Log.enableLogger(true);
  Log.i("main", "Started");
}

// return CircularProgressIndicator();
// final tag = "MyApp";
// Future<User> getUserData() => UserPreferences().getUser();
// Log.d(tag, "getUserData");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      transitionDuration: Duration(milliseconds: 750),
      //initialBinding: MainBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
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

import 'package:flutter/material.dart';
import 'package:gl_charge_app/app_life_cycle/life_cycle_event_handler.dart';
import 'package:gl_charge_app/utils/config.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/providers.dart';
import 'package:provider/provider.dart';
import 'authentication/forgot_password_page.dart';
import 'authentication/sign_in_page.dart';
import 'services/user_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
 // Config.init(); // TODO: todo stuff on start
  runApp(MyApp());
 // runApp(AppSplashScreen());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(LifecycleEventHandler(
      onInactiveCallBack: () => { print("LifecycleEvent :: onInactiveCallBack") },
      onPausedCallBack: () => { print("LifecycleEvent :: onPausedCallBack") },
      onDetachedCallBack: () => { UserService().setUserStatus(false), print("LifecycleEvent :: onDetachedCallBack") },
      onResumedCallBack: () => { UserService().setUserStatus(true), print("LifecycleEvent :: onResumedCallBack") },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
          //  title: Constants.appName,
            debugShowCheckedModeBanner: true,
          //  theme:notifier.dark ? Constants.darkTheme : Constants.lightTheme,
            home: ForgotPasswordPage() //SignInPage(),
          //   home: StreamBuilder(
          //     stream: AuthTest.getBoolValue().asStream(),
          //     builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          //       if (snapshot.hasData && snapshot.data) {
          //         return TabsScreenHolder();
          //       } else {
          //         return LandingPage();
          //       }
          //     },
          //   ),
          );
        },
      ),
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

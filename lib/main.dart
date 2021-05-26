import 'package:flutter/material.dart';
import 'package:gl_charge_app/authentication/landing/landing_page.dart';
import 'package:gl_charge_app/authentication/log_in/login_page.dart';
import 'package:gl_charge_app/authentication/register/register.dart';
import 'package:gl_charge_app/screens/settings_screen.dart';
import 'package:gl_charge_app/screens/tabs_screen_holder.dart';
import 'package:gl_charge_app/utils/config.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/providers.dart';
import 'package:provider/provider.dart';
import 'authentication/create_account/create_account_page.dart';
import 'authentication/landing/landing_page.dart';
import 'components/life_cycle_event_handler.dart';
import 'services/auth_test.dart';
import 'services/user_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Config.init();
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
      detachedCallBack: () => UserService().setUserStatus(false),
      resumeCallBack: () => UserService().setUserStatus(true),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            title: Constants.appName,
            debugShowCheckedModeBanner: false,
          //  theme:notifier.dark ? Constants.darkTheme : Constants.lightTheme,
            home: StreamBuilder(
              stream: AuthTest.getBoolValue().asStream(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.hasData && snapshot.data) {
                  return TabsScreenHolder();
                } else {
                  return LandingPage();
                }
              },
            ),
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

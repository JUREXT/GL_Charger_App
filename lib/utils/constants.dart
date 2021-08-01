import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  // REST Api related strings
  static const String liveBaseURLTest = "https://jsonplaceholder.typicode.com";
  static const String liveBaseURL = "https://home.dev.glcharge.com/api/v1";
  static const String localBaseURL = "http://10.0.2.2:4000/api/v1";
  static const String baseURL = liveBaseURL;
  static const String logInEndPoint = "/login";
  static const String registerEndPoint = "/register";
  static const String forgotPassword = "/resetPassword";
  static const String testEndPoint = "/users/1";
  String getBaseUrl(bool setTestUrl) {
    if(setTestUrl) return liveBaseURLTest;
    return baseURL;
  }

  // App related strings
  static String appName = "GL Charger";
  // Privacy and shop related strings
  static const shopUrl = "https://www.google.com/";
  static const privacyPolicyUrl = "https://www.google.com/";
  // Transition speed
  static const switchSpeedMainTabsScreenHolder = 500;
  static const switchSpeedStartTabsScreenHolder = 500;

  // Colors for theme
  // static Color lightPrimary = Color(0xfff3f4f9);
  // static Color darkPrimary = Color(0xff2B2B2B);
  // static Color lightAccent = Color(0xff886EE4);
  // static Color darkAccent = Color(0xff886EE4);
  // static Color lightBG = Color(0xfff3f4f9);
  // static Color darkBG = Color(0xff2B2B2B);

  // TODO: colors from figma
  static const ColorYellow = Color(0xFFE1E43B); // #E1E43B
  static const ColorWhite = Color(0xFFFCFCFA); // #FCFCFA
  static const ColorLightGrey = Color(0xFF212123); // #212123
  static const ColorBlack = Color(0xFF141414); // #141414
  static const ColorLightPurple = Color(0xFF8B91A8); // #8B91A8
  static const ColorLightGreen = Color(0xFF20C997); // #20C997
  static const ColorRed = Color(0xFFFF4D4F); // #FF4D4F
  static const ColorDivider = Color(0xFFCDD4D9); // #CDD4D9
  static const ColorDivider2 = Color(0xFF707070); // #707070
  static const ColorGreenish = Color(0xFF424322); // #424322

  // static ThemeData lightTheme = ThemeData(
  //   fontFamily: 'SF',
  //   backgroundColor: lightBG,
  //   primaryColor: lightPrimary,
  //   accentColor: lightAccent,
  //   cursorColor: lightAccent,
  //   scaffoldBackgroundColor: lightBG,
  //   bottomAppBarTheme: BottomAppBarTheme(
  //     elevation: 0,
  //     color: lightBG,
  //   ),
  //   appBarTheme: AppBarTheme(
  //     elevation: 0,
  //     textTheme: TextTheme(
  //       headline6: TextStyle(
  //         color: Colors.black,
  //         fontSize: 20,
  //         fontWeight: FontWeight.w600,
  //         fontFamily: 'SF',
  //       ),
  //     ),
  //   ),
  // );

  // static ThemeData darkTheme = ThemeData(
  //   fontFamily: 'SF',
  //   brightness: Brightness.dark,
  //   backgroundColor: darkBG,
  //   primaryColor: darkPrimary,
  //   accentColor: darkAccent,
  //   scaffoldBackgroundColor: darkBG,
  //   cursorColor: darkAccent,
  //   bottomAppBarTheme: BottomAppBarTheme(
  //     elevation: 0,
  //     color: darkBG,
  //   ),
  //   appBarTheme: AppBarTheme(
  //     elevation: 0,
  //     textTheme: TextTheme(
  //       headline6: TextStyle(
  //         color: lightBG,
  //         fontSize: 20,
  //         fontWeight: FontWeight.w600,
  //         fontFamily: 'SF',
  //       ),
  //     ),
  //   ),
  // );

  // static List<T> map<T>(List list, Function handler) {
  //   List<T> result = [];
  //   for (var i = 0; i < list.length; i++) {
  //     result.add(handler(i, list[i]));
  //   }
  //
  //   return result;
  // }
}

// class ThemeNotifier extends ChangeNotifier {
//   final String key = 'theme';
//   SharedPreferences _prefs;
//   bool _darkTheme;
//
//   bool get dark => _darkTheme;
//
//   ThemeNotifier() {
//     _darkTheme = true;
//     _loadfromPrefs();
//   }
//
//   toggleTheme() { // TODO: later when light and dark colors are defined trough out the app
//     _darkTheme = !_darkTheme;
//     _saveToPrefs();
//     notifyListeners();
//   }
//
//   _initPrefs() async {
//     if (_prefs == null) _prefs = await SharedPreferences.getInstance();
//   }
//
//   _loadfromPrefs() async {
//     await _initPrefs();
//     _darkTheme = _prefs.getBool(key) ?? true;
//     notifyListeners();
//   }
//
//   _saveToPrefs() async {
//     await _initPrefs();
//     _prefs.setBool(key, _darkTheme);
//   }
// }
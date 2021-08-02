import 'package:get/get.dart';
import 'package:gl_charge_app/pages/authentication_pages/forgot_password/forgot_password_binding.dart';
import 'package:gl_charge_app/pages/authentication_pages/forgot_password/forgot_password_page.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_in/sign_in_binding.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_in/sign_in_page.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_up/sign_up_binding.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_up/sign_up_page.dart';
import 'package:gl_charge_app/pages/developer_tools/dev_tools_screen.dart';
import 'package:gl_charge_app/pages/main_views/main_screen_holder/main_screen_holder_binding.dart';
import 'package:gl_charge_app/pages/main_views/main_screen_holder/main_tabs_screen_holder.dart';
import 'package:gl_charge_app/pages/main_views/select_charger_screen/select_charger_binding.dart';
import 'package:gl_charge_app/pages/main_views/select_charger_screen/select_charger_screen.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
    GetPage(
      name: Routes.SIGN_IN,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.SELECT_CHARGER,
      page: () => SelectChargerScreen(),
      binding: SelectChargerBinding(),
    ),
    GetPage(
      name: Routes.MAIN_TAB_HOLDER,
      page: () => MainTabsScreenHolder(),
      binding: MainScreenHolderBinding(),
    ),
    GetPage(
      name: Routes.DEVELOPER_TOOLS,
      page: () => DevToolsScreen(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}

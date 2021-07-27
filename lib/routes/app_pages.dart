import 'package:get/get.dart';
import 'package:gl_charge_app/pages/authentication_pages/forgot_password/forgot_password_binding.dart';
import 'package:gl_charge_app/pages/authentication_pages/forgot_password/forgot_password_page.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_in/sign_in_binding.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_in/sign_in_page.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_up/sign_up_binding.dart';
import 'package:gl_charge_app/pages/authentication_pages/sign_up/sign_up_page.dart';
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
      name: Routes.SELECT_CHARGER, // TODO; update with real objects
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.MAIN_TAB_HOLDER,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.DEVELOPER_TOOLS,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}

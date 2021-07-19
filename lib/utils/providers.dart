import 'package:gl_charge_app/authentication/login_view_model.dart';
import 'package:gl_charge_app/providers/auth/register_view_model.dart';
import 'package:gl_charge_app/providers/user/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'constants.dart';

// TODO: import later other screens
List<SingleChildWidget> providers = [
 // ChangeNotifierProvider(create: (_) => RegisterViewModel()),
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ChangeNotifierProvider(create: (_) => UserViewModel()),
];

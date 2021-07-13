import 'package:gl_charge_app/view_models/auth/login_view_model.dart';
import 'package:gl_charge_app/view_models/auth/register_view_model.dart';
import 'package:gl_charge_app/view_models/user/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'constants.dart';

// TODO: import later other screens
List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => RegisterViewModel()),
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ChangeNotifierProvider(create: (_) => UserViewModel()),
  ChangeNotifierProvider(create: (_) => ThemeNotifier()),
];

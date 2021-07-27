import 'package:gl_charge_app/providers/user/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// TODO: import later other screens
List<SingleChildWidget> providers = [
 // ChangeNotifierProvider(create: (_) => RegisterViewModel()),
  ChangeNotifierProvider(create: (_) => UserViewModel()),
];

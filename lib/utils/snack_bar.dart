import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/widgets.dart';

showSnackBar(BuildContext context, String title, String message, int duration) {
  return Flushbar(title: title, message: message, duration: Duration(seconds: duration)).show(context);
}


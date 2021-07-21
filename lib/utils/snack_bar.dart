import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';

snackBar(BuildContext context, String title, String message, int duration) {
  return Flushbar(
    title: title,
    message: message,
    duration: Duration(seconds: duration),
  ).show(context);
}


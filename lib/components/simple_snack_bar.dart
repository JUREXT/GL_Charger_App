import 'package:flutter/material.dart';

simpleSnackBar(BuildContext context, String text) async {
  var snackBar = SnackBar(
    content: Text(text),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

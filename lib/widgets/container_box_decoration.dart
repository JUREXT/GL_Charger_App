import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';

BoxDecoration containerBoxDecoration() {
  return BoxDecoration(
      color: Constants.ColorGreenish,
      border: Border.all(width: 2, color: Constants.ColorYellow),
      borderRadius: BorderRadius.all(Radius.circular(8)));
}

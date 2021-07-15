import 'package:flutter/material.dart';

import '../utils/constants.dart';

BoxDecoration containerBoxDecoration() {
  return BoxDecoration(
      color: Constants.ColorGreenish,
      border: Border.all(width: 2, color: Constants.ColorYellow),
      borderRadius: BorderRadius.all(Radius.circular(8)));
}

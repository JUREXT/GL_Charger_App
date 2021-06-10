import 'package:flutter/material.dart';

import '../utils/constants.dart';

Widget appBarBackNavigation(BuildContext context) {
  return AppBar(
    backgroundColor: Constants.ColorLightGrey,
    automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.arrow_back),
        onPressed:() => Navigator.pop(context, false),
      )
  );
}
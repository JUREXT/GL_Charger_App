import 'package:flutter/material.dart';

import '../utils/constants.dart';

Widget appBarBackNavigation(BuildContext context) {
  return AppBar(
    backgroundColor: Constants.ColorLightGrey,
    elevation: 0, // removes shadow under toolbar
    automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.arrow_back),
        onPressed:() => Navigator.pop(context, false),
      )
  );
}
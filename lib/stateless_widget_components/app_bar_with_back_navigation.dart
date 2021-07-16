import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AppBarWithBackNavigation extends StatelessWidget implements PreferredSizeWidget {

  final VoidCallback onNavigateBackCallback;
  const AppBarWithBackNavigation({Key key, @required this.onNavigateBackCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Constants.ColorLightGrey,
        elevation: 0, // removes shadow under toolbar
        automaticallyImplyLeading: true,
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => onNavigateBackCallback(),
        )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
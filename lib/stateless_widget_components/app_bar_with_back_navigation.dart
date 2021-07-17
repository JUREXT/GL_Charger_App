import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AppBarWithBackNavigation extends StatelessWidget implements PreferredSizeWidget {

  final bool backIconVisible;
  final VoidCallback onNavigateBackCallback;
  const AppBarWithBackNavigation({Key key, this.onNavigateBackCallback, this.backIconVisible = true }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Constants.ColorLightGrey,
        elevation: 0, // removes shadow under toolbar
        automaticallyImplyLeading: true,
        leading: Visibility(
          visible: backIconVisible,
          child: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => onNavigateBackCallback(),
          ),
        )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
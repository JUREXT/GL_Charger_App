import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/constants.dart';

class AppBar2 extends StatelessWidget implements PreferredSizeWidget {

  final String title1;
  final String title2;
  const AppBar2({Key key, @required this.title1, @required this.title2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Constants.ColorYellow),
      backgroundColor: Constants.ColorLightGrey,
      automaticallyImplyLeading: false,
      title: RichText(
        text: TextSpan(
          text: title1,
          style: TextStyle(
            color: Constants.ColorWhite,
            fontWeight: FontWeight.normal,
            fontSize: 24,
          ),
          children: [
            TextSpan(text: " "),
            TextSpan(
              text: title2,
              style: TextStyle(
                color:  Constants.ColorYellow,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
          child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(color: Constants.ColorYellow, height: 2.0)),
          preferredSize: Size.fromHeight(60.0)),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
}


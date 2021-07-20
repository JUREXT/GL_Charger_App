import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {

  final String text;
  CircularLoader({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Text(" Authenticating ... Please wait") // TODO: use TextCustom later
        ],
      ),
    );
  }
}
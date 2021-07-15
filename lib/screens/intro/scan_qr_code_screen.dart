import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/components/app_bar1.dart';
import 'package:gl_charge_app/components/button_black.dart';
import 'package:gl_charge_app/components/simple_snack_bar.dart';
import 'package:gl_charge_app/utils/constants.dart';

class ScanQRCodeScreen extends StatefulWidget {
  @override
  _ScanQRCodeScreenState createState() => _ScanQRCodeScreenState();
}

class _ScanQRCodeScreenState extends State<ScanQRCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar1(title: "Scan Charger"),
      backgroundColor: Constants.ColorLightGrey,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ButtonBlack(
                text: "Scan QR Code",
                onPressed: () {
                  simpleSnackBar(context, "QR Code Scan Completed!");
                }),
          ],
        ),
      ),
    );
  }
}

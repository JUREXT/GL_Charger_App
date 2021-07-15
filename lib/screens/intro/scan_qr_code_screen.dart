import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBar1.dart';
import 'package:gl_charge_app/components/button_black.dart';
import 'package:gl_charge_app/widgets/appSimpleSnackBar.dart';

class ScanQRCodeScreen extends StatefulWidget {
  @override
  _ScanQRCodeScreenState createState() => _ScanQRCodeScreenState();
}

class _ScanQRCodeScreenState extends State<ScanQRCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1("Scan Charger"),
      backgroundColor: Constants.ColorLightGrey,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ButtonBlack(
                text: "Scan QR Code",
                onPressed: () {
                  appSimpleSnackBar(context, "QR Code Scan Completed!");
                }),
          ],
        ),
      ),
    );
  }
}

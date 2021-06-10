import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/screens/main_tabs_screen_holder.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBar1.dart';
import 'package:gl_charge_app/widgets/appChargerListItem.dart';
import 'package:gl_charge_app/widgets/appCustomButtonBlack.dart';
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
            AppCustomButtonBlack(
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

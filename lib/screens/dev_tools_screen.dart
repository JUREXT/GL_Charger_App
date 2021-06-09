import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBar1.dart';
import 'package:gl_charge_app/widgets/appCustomButton1.dart';
import 'package:gl_charge_app/widgets/appSimpleSnackBar.dart';
import 'package:gl_charge_app/widgets/appText.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:connectivity/connectivity.dart';

class DevToolsScreen extends StatefulWidget {
  @override
  _ShopScreen createState() => _ShopScreen();
}

class _ShopScreen extends State<DevToolsScreen> {
  var networkSubscription;
  var connectionResult;

  @override
  initState() {
    super.initState();
    networkSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print("Current network status: " + result.toString());
      setState(() => connectionResult = result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar1("Dev Tools"),
      backgroundColor: Constants.ColorLightGrey,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            
            AppCustomButton1(text: "Test Btn", onPressed: () {
              appSimpleSnackBar(context, "Test");
            }),

          ],
        ),
      ),
    );
  }


  @override
  dispose() {
    super.dispose();
    networkSubscription.cancel();
  }
}

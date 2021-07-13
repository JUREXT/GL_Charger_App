import 'package:flutter/material.dart';
import 'package:gl_charge_app/authentication/landing/landing_page.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appBar1.dart';
import 'package:gl_charge_app/widgets/appCustomButtonBlack.dart';
import 'package:gl_charge_app/widgets/appCustomButtonYellow.dart';
import 'package:gl_charge_app/widgets/appSimpleSnackBar.dart';
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
      backgroundColor: Constants.ColorGreenish,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            AppCustomButtonBlack(
                text: "Logout User",
                onPressed: () {
                  appSimpleSnackBar(context, "User Signed Out!");
                  Route route =
                      MaterialPageRoute(builder: (context) => LandingPage());
                  Navigator.pushReplacement(context, route);
                }),
            SizedBox(height: 10),
            AppCustomButtonYellow(
                text: "Logout User",
                onPressed: () {
                  appSimpleSnackBar(context, "User Signed Out!");
                  Route route = MaterialPageRoute(builder: (context) => LandingPage());
                  Navigator.pushReplacement(context, route);
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

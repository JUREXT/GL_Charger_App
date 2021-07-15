import 'package:flutter/material.dart';
import 'package:gl_charge_app/authentication/sign_in_page.dart';
import 'package:gl_charge_app/components/app_bar1.dart';
import 'package:gl_charge_app/components/simple_snack_bar.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/components/button_black.dart';
import 'package:gl_charge_app/components/button_yellow.dart';
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
      appBar: AppBar1(title: 'Dev Tools'),
      backgroundColor: Constants.ColorGreenish,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            ButtonBlack(
                text: "Logout User",
                onPressed: () {
                  simpleSnackBar(context, "User Signed Out!");
                  Route route =
                      MaterialPageRoute(builder: (context) => SignInPage());
                  Navigator.pushReplacement(context, route);
                }),
            SizedBox(height: 10),
            ButtonYellow(
                text: "Logout User",
                onPressed: () {
                  simpleSnackBar(context, "User Signed Out!");
                  Route route = MaterialPageRoute(builder: (context) => SignInPage());
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

import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:connectivity/connectivity.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreen createState() => _ShopScreen();
}

class _ShopScreen extends State<ShopScreen> {

  static const _url = 'https://flutter.dev';
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
    if (connectionResult == ConnectivityResult.wifi ||
        connectionResult == ConnectivityResult.mobile) {
      launchURL();
      return Text("");
    } else {
      return Container(
        color: Constants.ColorBlack,
        child: Align(
          alignment: Alignment.center,
          child: Text("Connectivity problem \n Check Wi-Fi connection",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'SF',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Constants.ColorWhite)),
        ),
      );
    }
  }

  void launchURL() async => await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

  @override
  dispose() {
    super.dispose();
    networkSubscription.cancel();
  }
}

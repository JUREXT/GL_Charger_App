import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appText.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:connectivity/connectivity.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreen createState() => _ShopScreen();
}

class _ShopScreen extends State<ShopScreen> {
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

  Widget openWebPage() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        width: double.infinity,
        height: 80,
        child: RaisedButton(
          child: appText("Continue to Shop Web Page", 17.0,
              Constants.ColorYellow, TextDecoration.none),
          color: Constants.ColorBlack,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            _openShopWebsite();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Constants.ColorLightGrey, child: openWebPage());
  }

  _openShopWebsite() async {
    const url = Constants.shopUrl;
    if (connectionResult == ConnectivityResult.wifi ||
        connectionResult == ConnectivityResult.mobile) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        snackBar("Web page can't be opened!");
      }
    } else {
      snackBar("No internet connection!");
    }
  }

  snackBar(String text) {
    var snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  dispose() {
    super.dispose();
    networkSubscription.cancel();
  }
}

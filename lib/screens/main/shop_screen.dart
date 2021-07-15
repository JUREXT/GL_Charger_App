import 'package:flutter/material.dart';
import 'package:gl_charge_app/components/button_yellow.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/appSimpleSnackBar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:connectivity/connectivity.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreen createState() => _ShopScreen();
}

class _ShopScreen extends State<ShopScreen> {

  // var networkSubscription;
  // var connectionResult;

  @override
  initState() {
    super.initState();
    // networkSubscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) {
    //   print("Current network status: " + result.toString());
    //   setState(() => connectionResult = result);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.ColorLightGrey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/logo_25_size.png", width: 200),
            SizedBox(height: 30),
            ButtonYellow(
                text: "Continue to shop Web page",
                onPressed: () => _openShopWebsite()),
          ],
        ),
      ),
    );
  }

  _openShopWebsite() async {
    const url = Constants.shopUrl;
  //  if (connectionResult == ConnectivityResult.wifi || connectionResult == ConnectivityResult.mobile) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        appSimpleSnackBar(context, "Web page can't be opened!");
      }
    // } else {
    //   appSimpleSnackBar(context, "No internet connection!");
    // }
  }

  @override
  dispose() {
    super.dispose();
   // networkSubscription.cancel();
  }
}

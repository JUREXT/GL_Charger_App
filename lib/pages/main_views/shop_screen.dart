import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/button_yellow.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/url_navigation.dart';

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
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        color: Constants.ColorLightGrey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/logo_25_size.png", width: 200),
              SizedBox(height: 30),
              ButtonYellow(text: "Continue to shop Web page", onPressed: () => UrlNavigation.navigateTo(context, Constants.shopUrl)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
   // networkSubscription.cancel();
  }
}

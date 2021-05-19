import 'package:flutter/material.dart';
import 'dart:async';

import 'package:gl_charge_app/utils/constants.dart';

class UsersScreen extends StatefulWidget {
  UsersScreen({Key key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  Timer _timer;
  double percentValue = 0.0;
  String percentString = "0";

  @override
  void initState() {
    timer();
    super.initState();
  }

  @override
  void dispose() {
    if(_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  timer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(percentValue >= 0.9) {
          percentValue = 0.0;
        }
        percentValue += 0.01;
        percentString = (percentValue * 100).toStringAsFixed(0);
      });
    });
  }

  // SvgPicture.asset("assets/images/logo.svg")

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.ColorBlack
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // CircularPercentIndicator(
          //   radius: 300.0,
          //   lineWidth: 15.0,
          //   percent: percentValue,
          //  // center:  Text('State', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          //   center: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Text('State', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          //         Text('Charging $percentString%', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
          //       ],
          //     ),
          //   ),
          //   backgroundColor: Colors.grey,
          //   progressColor: Colors.blue,
          //   animation: true,
          //   circularStrokeCap: CircularStrokeCap.round,
          //  // header: Text("Header"),
          //  // footer: Text('Charged $percentString%', style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
          // ),
          //SvgPicture.asset(),
         // Image.asset(ImagesApp.ImageLogoPng),
          SizedBox(height: 30.0),
          Text('Users Screen', style: TextStyle(fontFamily: 'SF', fontSize: 32.0, fontWeight: FontWeight.normal, color: Constants.ColorWhite)),
        ],
      ),
    );
  }


}

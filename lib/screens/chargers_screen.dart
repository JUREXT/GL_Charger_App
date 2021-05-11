import 'package:flutter/material.dart';
import 'dart:async';

class ChargersScreen extends StatefulWidget {
  ChargersScreen({Key key}) : super(key: key);

  @override
  _ChargersScreenState createState() => _ChargersScreenState();
}

class _ChargersScreenState extends State<ChargersScreen> {

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


  Container circleData(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
         border: Border.all(width: 2),
        shape: BoxShape.circle,
        // You can use like this way or like the below line
        //borderRadius: new BorderRadius.circular(30.0),
        color: color,
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('9.5 Kw', style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400, color: Colors.white)),
         // Text('Dummy Text', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white)),
        ],
      ),
    );
  }

  Container circleData1(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
         border: Border.all(width: 1),
        shape: BoxShape.circle,
        // You can use like this way or like the below line
        //borderRadius: new BorderRadius.circular(30.0),
        color: color,
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('16.03 A', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.white)),
        ],
      ),
    );
  }

  Container circleData2(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        shape: BoxShape.circle,
        // You can use like this way or like the below line
        //borderRadius: new BorderRadius.circular(30.0),
        color: color,
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('33.25 Kw', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400, color: Colors.white)),
          Text('00.15.22', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.white)),
         // Text('Dummy Text', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white)),
        ],
      ),
    );
  }

  getWidth(BuildContext context) {
   return MediaQuery. of(context).size.width;
  }

  getHeight(BuildContext context) {
    return MediaQuery. of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
           children: [
             Positioned(top: getHeight(context) / 7, left: getWidth(context) / 10, child: circleData(300.0, Colors.black)),
             Positioned(top: getHeight(context) / 2 + 10, left: getWidth(context) / 8, child: circleData1(130.0, Colors.lightBlue)),
             Positioned(top: getHeight(context) / 2 + 40, left: getWidth(context) / 3 + 30, child: circleData2(160.0, Colors.black87))
           ],
         )

    );
  }

}
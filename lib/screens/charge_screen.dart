import 'package:circle_button/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/widgets/appBar2.dart';
import 'package:gl_charge_app/widgets/appContainerDecoration.dart';
import 'package:gl_charge_app/widgets/appSpannedText.dart';

import '../utils/constants.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';
import '../utils/constants.dart';
import '../widgets/appText.dart';

class ChargeScreen extends StatefulWidget {
  ChargeScreen({Key key}) : super(key: key);

  @override
  _ChargeScreenState createState() => _ChargeScreenState();
}

class _ChargeScreenState extends State<ChargeScreen> {
  @override
  Widget build(BuildContext context) {
    var _value = 10.0;

    return Scaffold(
        appBar: appBar2("Home", "Charger 1"),
        backgroundColor: Constants.ColorLightGrey,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Constants.ColorBlack,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(9, 9, 9, 9),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          appText("LAST SESSION", 12.0, Constants.ColorYellow,
                              TextDecoration.none),
                          SizedBox(height: 6),
                          appSpannedText("Consumed Energy:", "150kW", 12,
                              Constants.ColorWhite, Constants.ColorYellow),
                          SizedBox(height: 6),
                          appSpannedText("Duration:", "1h 30min", 12,
                              Constants.ColorWhite, Constants.ColorYellow),
                        ]),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 162,
                  // color: Constants.ColorWhite,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            height: 70,
                            decoration: appContainerBoxDecoration(),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 2),
                                  appText("CURRENT", 8.0, Constants.ColorYellow,
                                      TextDecoration.none),
                                  SizedBox(height: 10),
                                  appText("0 A", 24.0, Constants.ColorWhite,
                                      TextDecoration.none),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 70,
                            decoration: appContainerBoxDecoration(),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 2),
                                  appText("ENERGY", 8.0, Constants.ColorYellow,
                                      TextDecoration.none),
                                  SizedBox(height: 10),
                                  appText("0 kW", 24.0, Constants.ColorWhite,
                                      TextDecoration.none),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            height: 70,
                            decoration: appContainerBoxDecoration(),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 2),
                                  appText("POWER", 8.0, Constants.ColorYellow,
                                      TextDecoration.none),
                                  SizedBox(height: 10),
                                  appText("0 kW", 24.0, Constants.ColorWhite,
                                      TextDecoration.none),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 70,
                            decoration: appContainerBoxDecoration(),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 2),
                                  appText(
                                      "DURATION",
                                      8.0,
                                      Constants.ColorYellow,
                                      TextDecoration.none),
                                  SizedBox(height: 10),
                                  appText("0 min", 24.0, Constants.ColorWhite,
                                      TextDecoration.none),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  // color: Colors.lightGreen,
                  child: Center(
                    child: appText("Change Current", 16.0, Constants.ColorWhite, TextDecoration.none),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 30,
                  color: Colors.blue,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.red[700],
                      inactiveTrackColor: Colors.red[100],
                      trackShape: RoundedRectSliderTrackShape(),
                      trackHeight: 4.0,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      thumbColor: Colors.redAccent,
                      overlayColor: Colors.red.withAlpha(32),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 28.0),
                      tickMarkShape: RoundSliderTickMarkShape(),
                      activeTickMarkColor: Colors.red[700],
                      inactiveTickMarkColor: Colors.red[100],
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.redAccent,
                      valueIndicatorTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    child: Slider(
                      value: _value,
                      min: 0,
                      max: 100,
                      label: '$_value',
                      onChanged: (value) {
                        setState(
                          () {
                            _value = value;
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                //  color: Colors.green,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        // just an empty SizedBox to add some spacing
                        SizedBox(height: 20),
                        Container(
                          width: 175,
                          height: 175,
                          child: Center(
                            child: CircleButton(
                              onTap: () => {},
                              width: 175.0,
                              height: 175.0,
                              borderColor: Constants.ColorYellow,
                              borderWidth: 10.0,
                              borderStyle: BorderStyle.solid,
                              backgroundColor: Constants.ColorGreenish,
                              child:appText("Start", 24.0, Constants.ColorWhite,
                                  TextDecoration.none),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:circle_button/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/models/enum/energy_unit_name_type.dart';
import 'package:gl_charge_app/widgets/appBar2.dart';
import 'package:gl_charge_app/widgets/appContainerDecoration.dart';
import 'package:gl_charge_app/widgets/appEnergyCard.dart';
import 'package:gl_charge_app/widgets/appSpannedText.dart';

import '../utils/constants.dart';
import '../widgets/appText.dart';

class ChargeScreen extends StatefulWidget {
  ChargeScreen({Key key}) : super(key: key);

  @override
  _ChargeScreenState createState() => _ChargeScreenState();
}

class _ChargeScreenState extends State<ChargeScreen> {

  double _startSliderValue = 30.0;
  String _currentSliderValue;
  String _chosenValue;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = _startSliderValue.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {

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
                          // Container(
                          //   width: 150,
                          //   height: 70,
                          //   decoration: appContainerBoxDecoration(),
                          //   child: Center(
                          //     child: Column(
                          //       children: [
                          //         SizedBox(height: 2),
                          //         appText("CURRENT", 8.0, Constants.ColorYellow,
                          //             TextDecoration.none),
                          //         SizedBox(height: 10),
                          //         appText("$_currentSliderValue A", 24.0, Constants.ColorWhite, TextDecoration.none),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          appEnergyCard("$_currentSliderValue", EnergyUnitNameType.CURRENT),
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
                                  appText("$_currentSliderValue kW", 24.0, Constants.ColorWhite,
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
                                  appText("$_currentSliderValue kW", 24.0, Constants.ColorWhite,
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
                                  appText("$_currentSliderValue min", 24.0, Constants.ColorWhite,
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
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        appText("Change Current:", 16.0, Constants.ColorWhite, TextDecoration.none),
                        SizedBox(width: 3),
                        appText("$_currentSliderValue", 16.0, Constants.ColorWhite, TextDecoration.none),
                        appText("A", 16.0, Constants.ColorWhite, TextDecoration.none),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 30,
                 // color: Colors.blue,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Constants.ColorGreenish,
                      inactiveTrackColor: Constants.ColorGreenish,
                      trackShape: RoundedRectSliderTrackShape(),
                      trackHeight: 13.0,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      thumbColor: Constants.ColorYellow,
                      overlayColor: Constants.ColorYellow,
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                      tickMarkShape: RoundSliderTickMarkShape()
                    ),
                    child: Slider(
                      value: _startSliderValue,
                      min: 0,
                      max: 100,
                     // label: "Value: $_currentSliderValue",
                      //divisions: 10,
                      onChanged: (newValue) {
                        print("Slider Value: " + newValue.toStringAsFixed(0));
                        setState(() {
                           _startSliderValue = newValue;
                           _currentSliderValue = _startSliderValue.toStringAsFixed(0);
                        });
                      },
                    ),
                  ),
                ),
                Container(
                 // color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("MIN", 12.0, Constants.ColorLightPurple, TextDecoration.none),
                        appText("MAX", 12.0, Constants.ColorLightPurple, TextDecoration.none),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
          Container(
           // color: Colors.red,
           // height: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Constants.ColorGreenish,
                  ),
                  child: DropdownButton<String>(
                    value: _chosenValue,
                    isExpanded: true,
                   // elevation: 16,
                   // style: TextStyle(color: Colors.black),
                    items: <String>[
                      'MAX POWER',
                      'Economy',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: appText(value, 14.0, Constants.ColorLightPurple, TextDecoration.none),
                      );
                    }).toList(),
                    hint: appText("Choose profile", 14.0, Constants.ColorLightPurple, TextDecoration.none),
                    onChanged: (String value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  //  color: Colors.green,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        // just an empty SizedBox to add some spacing
                        SizedBox(height: 10),
                        Container(
                          width: 175,
                          height: 175,
                          child: Center(
                            child: CircleButton(
                              onTap: () => {print("CircleButton Tap")},
                              width: 175.0,
                              height: 175.0,
                              borderColor: Constants.ColorYellow,
                              borderWidth: 10.0,
                              borderStyle: BorderStyle.solid,
                              backgroundColor: Constants.ColorGreenish,
                              child: appText("Start", 24.0,
                                  Constants.ColorWhite, TextDecoration.none),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}

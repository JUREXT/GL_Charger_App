import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar2.dart';
import 'package:gl_charge_app/stateless_widget_components/button_text.dart';
import 'package:gl_charge_app/stateless_widget_components/charge_circle_button.dart';
import 'package:gl_charge_app/stateless_widget_components/charge_e_card.dart';
import 'package:gl_charge_app/stateless_widget_components/charge_session.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/utils/log.dart';
import 'package:provider/provider.dart';
import 'charge_controller.dart';
import 'charge_notifier.dart';

class ChargeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ChargeNotifier(), child: ChargeScreen2()
    );
  }
}

class ChargeScreen2 extends StatefulWidget {
  ChargeScreen2({Key key}) : super(key: key);

  @override
  _ChargeScreen2State createState() => _ChargeScreen2State();
}


class _ChargeScreen2State extends State<ChargeScreen2> {
  final tag = "ChargeScreen";

  ChargeController controller = Get.find();

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

    final cn = Provider.of<ChargeNotifier>(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar2(title1: "Home", title2: cn.chargerName),
          backgroundColor: Constants.ColorLightGrey,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                children: [
                  ChargeSession(consumedEnergy: "150", duration: "1h 30min"),
                  SizedBox(height: 15),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ChargeECard(title: "CURRENT", value: "$_currentSliderValue", valueSign: "A"),
                            SizedBox(width: 10),
                            ChargeECard(title: "ENERGY", value: "$_currentSliderValue", valueSign: "A"),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            ChargeECard(title: "POWER", value: "$_currentSliderValue", valueSign: "A"),
                            SizedBox(width: 10),
                            ChargeECard(title: "DURATION", value: "$_currentSliderValue", valueSign: "A"),
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
                          TextCustom(text: "Charging Current:", textSize: 16.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none),
                          SizedBox(width: 3),
                          TextCustom(text: "$_currentSliderValue A", textSize: 16.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none),
                          TextCustom(text: "A", textSize: 16.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none),
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
                          TextCustom(text: "MIN", textSize: 12.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none),
                          TextCustom(text: "MAX", textSize: 12.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none),
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
                          child: TextCustom(text: value, textSize: 14.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none));
                      }).toList(),
                      hint: TextCustom(text: "Charging Profile", textSize: 14.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none),
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
                  Container(),
                  ChargeCircleButton(
                      width: 140.0,
                      height: 140.0,
                      child: ButtonText(text: "START", onPressed: () => { Log.d(tag, "CircleButton Tap") }, textSize: 22.0, textColor: Constants.ColorWhite, textDecoration: TextDecoration.none),
                      //onTap: () => { Log.d(tag, "CircleButton Tap") },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          )),
    );
  }
}

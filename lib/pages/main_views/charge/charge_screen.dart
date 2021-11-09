import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gl_charge_app/app_life_cycle/life_cycle_event_handler.dart';
import 'package:gl_charge_app/stateless_widget_components/app_bar2.dart';
import 'package:gl_charge_app/stateless_widget_components/button_text.dart';
import 'package:gl_charge_app/stateless_widget_components/charge_circle_button.dart';
import 'package:gl_charge_app/stateless_widget_components/charge_e_card.dart';
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


class _ChargeScreen2State extends State<ChargeScreen2> with WidgetsBindingObserver {
  final tag = "ChargeScreen";

  ChargeController controller = Get.find();

  //double _startSliderValue = 30.0;
  String _currentSliderValue;

  @override
  void initState() {
    super.initState();
    Log.d(tag, "initState");
    WidgetsBinding.instance.addObserver(this);
    controller.getTransactionByOcppId();

   // controller.billing();
   // controller.startTimer();
   // _currentSliderValue = _startSliderValue.toStringAsFixed(0);
  //  LifecycleEventHandler(onDetachedCallBack: )
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    Log.d(tag, "dispose");
    super.dispose();
  }

  // https://dev.to/pedromassango/onresume-and-onpause-for-widgets-on-flutter-27k2
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        Log.d(tag, "AppLifecycleState.inactive");
        break;
      case AppLifecycleState.paused:
        Log.d(tag, "AppLifecycleState.paused");
        break;
      case AppLifecycleState.detached:
        Log.d(tag, "AppLifecycleState.detached");
        break;
      case AppLifecycleState.resumed:
        Log.d(tag, "AppLifecycleState.resumed");
        controller.getTransactionByOcppId();
        break;
    }
  }

  @override
  void deactivate() {
   // controller.stopTimer();
    Log.d(tag, "deactivate");
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {

    final cn = Provider.of<ChargeNotifier>(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar2(title1: "Charger", title2: cn.chargerName), // TODO: later when charger will be defined, update title in toolbar
          backgroundColor: Constants.ColorLightGrey,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                children: [
                 // ChargeSession(consumedEnergy: "150", duration: "1h 30min"),
                  SizedBox(height: 15),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Obx(() { return ChargeECard(title: "charge_current".tr, value: controller.currentValue.value.toString(), valueSign: "A"); }),
                            SizedBox(width: 10),
                           // ChargeECard(title: "charge_energy".tr, value: "$_currentSliderValue", valueSign: "A"),
                            Obx(() { return ChargeECard(title: "charge_billing".tr, value: controller.billing.value.toString(), valueSign: "€"); }), // TODO: se rabi še end point
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Obx(() { return ChargeECard(title: "charge_power".tr, value: controller.power.value.toString(), valueSign: "kWh"); }),
                            SizedBox(width: 10),
                            Obx(() { return ChargeECard(title: "charge_duration".tr, value: controller.duration.value.toString(), valueSign: "min"); }),
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
                          TextCustom(text: "charge_charging_current".tr, textSize: 22.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none),
                          SizedBox(width: 3),
                          Obx(() { return TextCustom(text: controller.currentValue.value.toString(), textSize: 22.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none); }),
                          SizedBox(width: 3),
                          TextCustom(text: "charge_amp_unit".tr, textSize: 22.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Container(
                  //   height: 30,
                  //  // color: Colors.blue,
                  //   child: SliderTheme(
                  //     data: SliderTheme.of(context).copyWith(
                  //       activeTrackColor: Constants.ColorGreenish,
                  //       inactiveTrackColor: Constants.ColorGreenish,
                  //       trackShape: RoundedRectSliderTrackShape(),
                  //       trackHeight: 13.0,
                  //       thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  //       thumbColor: Constants.ColorYellow,
                  //       overlayColor: Constants.ColorYellow,
                  //       overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                  //       tickMarkShape: RoundSliderTickMarkShape()
                  //     ),
                  //     child: Slider(
                  //       value: _startSliderValue,
                  //       min: 0,
                  //       max: 100,
                  //      // label: "Value: $_currentSliderValue",
                  //       //divisions: 10,
                  //       onChanged: (newValue) {
                  //         print("Slider Value: " + newValue.toStringAsFixed(0));
                  //         setState(() {
                  //            _startSliderValue = newValue;
                  //            _currentSliderValue = _startSliderValue.toStringAsFixed(0);
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //  // color: Colors.blue,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 30, right: 30),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         TextCustom(text: "charge_min".tr, textSize: 12.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none),
                  //         TextCustom(text: "charge_max".tr, textSize: 12.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 30),
            // Container(
            //  //// color: Colors.red,
            //  //// height: 20,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       padding: const EdgeInsets.only(left: 20, right: 20),
            //       child: Theme(
            //         data: Theme.of(context).copyWith(
            //           canvasColor: Constants.ColorGreenish,
            //         ),
            //         child: DropdownButton<String>(
            //           value: _chosenValue,
            //           isExpanded: true,
            //          // elevation: 16,
            //          // style: TextStyle(color: Colors.black),
            //           items: <String>[
            //             'charge_option_max_power'.tr,
            //             'charge_option_economy'.tr,
            //           ].map<DropdownMenuItem<String>>((String value) {
            //             return DropdownMenuItem<String>(
            //               value: value,
            //               child: TextCustom(text: value, textSize: 14.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none));
            //           }).toList(),
            //           hint: TextCustom(text: "charge_charging_profile".tr, textSize: 14.0, textColor: Constants.ColorLightPurple, decoration: TextDecoration.none),
            //           onChanged: (String value) {
            //             setState(() {
            //               _chosenValue = value;
            //             });
            //           },
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
                  SizedBox(height: 5),
                  Container(),
                  ChargeCircleButton(
                      width: 200.0,
                      height: 200.0,
                      child: Obx(() { return ButtonText(text: controller.isCharging.value == false ? "charge_start".tr : "charge_stop".tr,  onPressed: () => { controller.startStopChargingToggle() }, textSize: 22.0, textColor: Constants.ColorWhite, textDecoration: TextDecoration.none); })),
                      //onTap: () => { Log.d(tag, "CircleButton Tap") },
                  SizedBox(height: 20),
                ],
              ),
            ),
          )),
    );
  }
}

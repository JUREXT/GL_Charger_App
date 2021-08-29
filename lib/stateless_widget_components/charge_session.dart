import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/spanned_text.dart';
import 'package:get/get.dart';

class ChargeSession extends StatelessWidget {

  final String consumedEnergy;
  final String duration;
  const ChargeSession({Key key, this.consumedEnergy, this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 75,
      decoration: BoxDecoration(
        color: Constants.ColorBlack,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextCustom(text: "last_session".tr, textSize: 12.0, textColor: Constants.ColorYellow, decoration: TextDecoration.none),
              SizedBox(height: 6),
              appSpannedText("last_session_consumed".tr, consumedEnergy + "session_unit".tr, 12.0, Constants.ColorWhite, Constants.ColorYellow),
              SizedBox(height: 6),
              appSpannedText("session_duration".tr, "$duration", 12.0, Constants.ColorWhite, Constants.ColorYellow)
            ]),
      ),
    );
  }
}

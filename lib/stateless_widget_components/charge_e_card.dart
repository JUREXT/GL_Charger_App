import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gl_charge_app/stateless_widget_components/text_custom.dart';
import 'package:gl_charge_app/utils/constants.dart';
import 'package:gl_charge_app/widgets/container_box_decoration.dart';

class ChargeECard extends StatelessWidget {

  final String title;
  final String value;
  final String valueSign;
  const ChargeECard({Key key, this.title, this.value, this.valueSign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      decoration: containerBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 15),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 4),
              TextCustom(text: title, textSize: 12.0, textColor: Constants.ColorYellow, decoration: TextDecoration.none),
              SizedBox(height: 5),
              TextCustom(text: value + " " + valueSign, textSize: 24.0, textColor: Constants.ColorWhite, decoration: TextDecoration.none),
            ],
          ),
        ),
      ),
    );
  }
}

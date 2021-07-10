import 'package:flutter/material.dart';
import 'package:gl_charge_app/models/enum/energy_unit_name_type.dart';

import '../utils/constants.dart';
import 'appContainerDecoration.dart';
import 'appText.dart';

Widget appEnergyCard(String value, String energyUnitType) {

  String finalValue = "";

  // switch(energyUnitType.toString()) {
  //   case EnergyUnitNameType.CURRENT:
  //   case EnergyUnitNameType.ENERGY:
  //   case EnergyUnitNameType.POWER: {
  //     finalValue = value + " " + energyUnitType.toString();
  //   }
  //   break;
  //   case EnergyUnitNameType.DURATION: {
  //     finalValue = value + " " + "Time";
  //   }
  //   break;
  //   default: {
  //     //statements;
  //   }
  //   break;
  // }

  return  Container(
    width: 150,
    height: 70,
    decoration: appContainerBoxDecoration(),
    child: Center(
      child: Column(
        children: [
          SizedBox(height: 2),
          appText(energyUnitType.toString(), 8.0, Constants.ColorYellow,  TextDecoration.none),
          SizedBox(height: 10),
          appText("OK", 24.0, Constants.ColorWhite, TextDecoration.none),
        ],
      ),
    ),
  );
}



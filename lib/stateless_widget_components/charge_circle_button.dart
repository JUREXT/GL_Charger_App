import 'package:flutter/material.dart';
import 'package:gl_charge_app/utils/constants.dart';

class ChargeCircleButton extends StatefulWidget {

  final VoidCallback onTap;
  final Widget child;
  final double width;
  final double height;

  const ChargeCircleButton({
    Key key,
    @required this.onTap,
    this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<ChargeCircleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: widget.width ?? 40,
        height: widget.height ?? 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Constants.ColorYellow,
            style: BorderStyle.solid,
            width: 10.0,
          ),
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 1],
            colors: [
              Constants.ColorYellow1,
              Constants.ColorBlack,
            ],
          ),
        ),
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}

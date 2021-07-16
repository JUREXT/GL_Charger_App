import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {

  final Color progressColor;
  const CircularProgress({Key key, this.progressColor = Colors.blue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: SpinKitFadingCircle(size: 40.0, color: progressColor));
  }
}

class LinearProgress extends StatelessWidget {

  final Color progressColor;
  const LinearProgress({Key key, this.progressColor = Colors.blue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: LinearProgressIndicator(valueColor: AlwaysStoppedAnimation(progressColor)));
  }
}

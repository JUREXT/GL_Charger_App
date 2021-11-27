import 'package:flutter/material.dart';

class SimpleLifecycleEventHandler extends WidgetsBindingObserver {
  SimpleLifecycleEventHandler({this.onResumedCallBack, this.onDetachedCallBack});

  final Function onResumedCallBack;
  final Function onDetachedCallBack;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        await onDetachedCallBack();
        break;
      case AppLifecycleState.resumed:
        await onResumedCallBack();
        break;
    }
  }
}

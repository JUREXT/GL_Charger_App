import 'package:flutter/material.dart';

class LifecycleEventHandler extends WidgetsBindingObserver {

  final Function onInactiveCallBack;
  final Function onPausedCallBack;
  final Function onDetachedCallBack;
  final Function onResumedCallBack;

  LifecycleEventHandler({this.onInactiveCallBack, this.onPausedCallBack, this.onResumedCallBack, this.onDetachedCallBack});

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
        await onInactiveCallBack();
        break;
      case AppLifecycleState.paused:
        await onPausedCallBack();
        break;
      case AppLifecycleState.detached:
        await onDetachedCallBack();
        break;
      case AppLifecycleState.resumed:
        await onResumedCallBack();
        break;
    }
  }
}

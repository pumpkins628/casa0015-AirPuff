// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/widgets.dart';

class HosEventBusUtils {
  static EventBus? _eventBus;

  static EventBus? shared() {
    _eventBus ??= EventBus();
    return _eventBus;
  }

  static Map<Type, List<StreamSubscription?>?> subscriptions = {};

  static StreamSubscription? on<T extends Object>(void Function(T event) onData,
      {Function? onError,
      void Function()? onDone,
      bool? cancelOnError,
      bool autoManaged = true}) {
    StreamSubscription? subscription = shared()?.on<T>().listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
    if (autoManaged == true) {
      List<StreamSubscription?> subs = subscriptions[T.runtimeType] ?? [];
      subs.add(subscription);
      subscriptions[T.runtimeType] = subs;
    }
    return subscription;
  }

  static void off<T extends Object>({StreamSubscription? subscription}) {
    subscriptions = {};
    if (subscription != null) {
      List<StreamSubscription?> subs = subscriptions[T.runtimeType] ?? [];
      subs.remove(subscription);
      subscriptions[T.runtimeType] = subs;
    } else {
      subscriptions[T.runtimeType] = null;
    }
  }

  static void fire(event) {
    shared()?.fire(event);
  }
}

mixin HosEventBusMixin<T extends StatefulWidget> on State<T> {
  EventBus? mEventBus = HosEventBusUtils.shared();

  List<StreamSubscription?> mEventBusSubscriptions = [];

  @protected
  void mAddEventBusListeners();

  void mAddEventBusListener<T>(void Function(T event) onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    mEventBusSubscriptions.add(mEventBus?.on<T>().listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError));
  }

  void mEventBusFire(event) {
    mEventBus?.fire(event);
  }

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
    debugPrint('dispose:HosEventBusMixin');
    if (mEventBusSubscriptions.isNotEmpty)
      for (var subscription in mEventBusSubscriptions) {
        subscription!.cancel();
      }
  }

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    debugPrint('initState:HosEventBusMixin');
    mAddEventBusListeners();
  }
}

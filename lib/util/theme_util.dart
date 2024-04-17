import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:rxdart/rxdart.dart";
import 'package:shengyu_weather_forecast/util/colours.dart';
import 'package:shengyu_weather_forecast/util/device.dart';

class ThemeUtils {
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color? getDarkColor(BuildContext context, Color darkColor) {
    return isDark(context) ? darkColor : null;
  }

  static Color? getIconColor(BuildContext context) {
    return isDark(context) ? Colours.dark_text : null;
  }

  static Color getStickyHeaderColor(BuildContext context) {
    return isDark(context) ? Colours.dark_bg_gray_ : Colours.bg_gray_;
  }

  static Color getDialogTextFieldColor(BuildContext context) {
    return isDark(context) ? Colours.dark_bg_gray_ : Colours.bg_gray;
  }

  static Color? getKeyboardActionsColor(BuildContext context) {
    return isDark(context) ? Colours.dark_bg_color : Colors.grey[200];
  }

  static StreamSubscription<dynamic>? _subscription;

  static void setSystemNavigationBar(ThemeMode mode) {
    _subscription?.cancel();
    _subscription =
        Stream.value(1).delay(const Duration(milliseconds: 200)).listen((_) {
      bool isDark = false;
      if (mode == ThemeMode.dark ||
          (mode == ThemeMode.system &&
              window.platformBrightness == Brightness.dark)) {
        isDark = true;
      }
      setSystemBarStyle(isDark: isDark);
    });
  }

  static void setSystemBarStyle({bool? isDark}) {
    if (Device.isAndroid) {
      final bool isDarkMode =
          isDark ?? window.platformBrightness == Brightness.dark;
      debugPrint('isDark: $isDarkMode');
      final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor:
            isDarkMode ? Colours.dark_bg_color : Colors.white,
        systemNavigationBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}

extension ThemeExtension on BuildContext {
  bool get isDark => ThemeUtils.isDark(this);
  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get dialogBackgroundColor => Theme.of(this).canvasColor;
}

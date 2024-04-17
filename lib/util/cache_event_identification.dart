import 'package:flutter/foundation.dart';

class Constant {
  static const bool inProduction = kReleaseMode;

  static const String isLogin = 'isLogin';

  static const String isNotFirstJoinApp = 'isNotFirstJoinApp';

  static const String isLoginYunXin = 'isLoginYunXin';

  static const String accountAndPassword = 'accountAndPassword';

  static bool isDriverTest = false;
  static bool isUnitTest = false;

  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';

  static const String account = 'account';
  static const String password = 'password';

  static const String accessToken = 'accessToken';

  static const String appKey = '97b68747775f789268b99d82b4b0e7d1';

  static const String refreshEventCount = 'REFRESH_EVENT_COUNT';
  static const String refreshChatPage = 'REFRESH_CHAT_PAGE';
}

extension StringExtension on String? {
  String get nullSafe => this ?? '';
}

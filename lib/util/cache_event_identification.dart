import 'package:flutter/foundation.dart';

class Constant {
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction = kReleaseMode;

  /// 是否登录的标志
  static const String isLogin = 'isLogin';

  /// 是否不是第一次进入app（是否需要开启通知权限检测）
  static const String isNotFirstJoinApp = 'isNotFirstJoinApp';

  /// 是否登录云信
  static const String  isLoginYunXin = 'isLoginYunXin';

  /// 缓存的账号密码
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
/// String 空安全处理
extension StringExtension on String? {
  String get nullSafe => this ?? '';
}


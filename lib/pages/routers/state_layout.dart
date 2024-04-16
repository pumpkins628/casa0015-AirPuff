import 'package:flutter/cupertino.dart';
import 'package:shengyu_weather_forecast/util/colours.dart';
import 'package:shengyu_weather_forecast/util/local_and_net_image.dart';
import 'package:shengyu_weather_forecast/util/theme_util.dart';

/// design/9暂无状态页面/index.html#artboard3
class StateLayout extends StatelessWidget {
  const StateLayout(
      {Key? key, required this.type, this.hintText, this.hintTitle, this.orderEmptyWidget})
      : super(key: key);

  final StateType type;
  final String? hintText;
  final String? hintTitle;
  final Widget? orderEmptyWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (type == StateType.loading)
            const CupertinoActivityIndicator(radius: 16.0)
          else if (type == StateType.orderList)
            orderEmptyWidget ?? Container()
          else if (type != StateType.empty)
              otherWidget(context)
        ],
      ),
    );
  }

  Widget otherWidget(BuildContext context) {
    return Column(
      children: [
        Text(
          hintTitle ?? type.hintTitle,
          style: const TextStyle(color: Colours.app_main,fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          width: double.infinity,
          height: 16,
        ),
        Opacity(
          opacity: context.isDark ? 1 : 1,
          child: LoadAssetImage(
            'state/${type.img}',
            width: 200,
            height: 200,
          ),
        ),
        const SizedBox(
          width: double.infinity,
          height: 16,
        ),
        Text(
          hintText ?? type.hintText,
          style: const TextStyle(color: Colours.app_main),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 180,
        ),
      ],
    );
  }
}

enum StateType {
  /// 订单
  order,

  /// 商品
  goods,

  /// 无网络
  network,

  /// 消息
  message,

  /// 加载中
  loading,

  ///无代办
  agent,

  /// 空
  empty,

  ///购物车
  cart,

  ///订单列表
  orderList,
  ///系统消息列表
  systemList,
  ///活动消息列表
  activeList
}

extension StateTypeExtension on StateType {
  String get img =>
      <String>['zwdd', 'zwsp', 'zwwl', 'zwxx', '', 'zwdb', '','no_production','','no_system_msg','no_active_msg'][index];

  String get hintText => <String>[
    '暂无订单',
    '暂无商品',
    'No network connection',
    '暂无消息',
    '',
    "There are currently no outstanding tasks in your 'To-Do' list. Keep browsing WeTire for your tire needs and we'll notify you here if there's anything that needs your attention. Happy shopping!",
    '',
    'Your cart is empty. Start shopping now!',
    '',
    'Your system messages will appear here. Check back to stay updated.',
    'The latest activities and offers will be displayed here. Stay tuned!'
  ][index];
  String get hintTitle => <String>[
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    'No System Messages',
    'No Latest Activities'
  ][index];
}

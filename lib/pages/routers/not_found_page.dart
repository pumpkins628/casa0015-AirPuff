import 'package:flutter/material.dart';
import 'package:shengyu_weather_forecast/util/app_bar.dart';
import 'package:shengyu_weather_forecast/pages/routers/state_layout.dart';

class NotFoundPage extends StatelessWidget {

  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        centerTitle: '页面不存在',
      ),
      body: StateLayout(
        type: StateType.message,
        hintText: '页面不存在',
      ),
    );
  }
}

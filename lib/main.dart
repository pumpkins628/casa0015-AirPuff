import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shengyu_weather_forecast/net/dio_utils.dart';
import 'package:shengyu_weather_forecast/net/http_api.dart';
import 'package:shengyu_weather_forecast/net/intercept.dart';
import 'package:shengyu_weather_forecast/pages/routers/routers.dart';
import 'package:shengyu_weather_forecast/pages/tabber.dart';
import 'package:shengyu_weather_forecast/util/cache_event_identification.dart';
import 'package:shengyu_weather_forecast/util/log_util.dart';
import 'package:sp_util/sp_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// sp初始化
  await SpUtil.getInstance();
  SpUtil.putBool(Constant.isLoginYunXin, false);

  runApp(const MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Log.init();
    initDio();
    Routes.initRoutes();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    });
  }

  void initDio() {
    /// 加载网络请求头+token
    final List<Interceptor> interceptors = <Interceptor>[];

    /// 统一添加身份验证请求头+token
    interceptors.add(AuthInterceptor());

    /// 打印Log(生产模式去除)
    if (!Constant.inProduction) {
      interceptors.add(LoggingInterceptor());
    }

    /// 适配数据(根据自己的数据结构，可自行选择添加)
    interceptors.add(AdapterInterceptor());
    configDio(
      interceptors: interceptors,
    );
  }


  @override
  Widget build(BuildContext context) {
    return OKToast(
      backgroundColor: Colors.black54,
      textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      radius: 20.0,
      position: ToastPosition.bottom,
      child: MaterialApp(
        title: '',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          fontFamily: 'Roboto',
          useMaterial3: true,
        ),

        navigatorKey: MyApp.navigatorKey,
        onGenerateRoute: Routes.router.generator,
        home: const DefaultTextStyle(
          style: TextStyle(color: Colors.black, fontSize: 14),
          child: Taber()
              ,
        ),
      ),
    );
  }
}
